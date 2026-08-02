import { ComponentProps } from "react";
import { render, screen } from "@testing-library/react";
import { ScoringKeySelector } from ".";
import { type GameSystem } from "Types/common";
import userEvent from "@testing-library/user-event";

describe("ScoringKeySelector", () => {
  let defaultProps: ComponentProps<typeof ScoringKeySelector> = {
    modelName: "game_objective",
    groupedGameSystems: [
      {
        groupName: "Test",
        gameSystems: [
          {
            id: "1",
            name: "Test 1",
            scoringKeys: ["Key 1.1", "Key 1.2"],
          } as GameSystem,
          {
            id: "2",
            name: "Test 2",
            scoringKeys: ["Key 2.1", "Key 2.2"],
          } as GameSystem,
        ],
      },
    ],
  };

  it("renders", () => {
    render(<ScoringKeySelector {...defaultProps} />);

    expect(
      screen.getByRole("combobox", { name: "Game System" }),
    ).toBeInTheDocument();

    expect(
      screen.getByRole("combobox", { name: "Scoring Key" }),
    ).toBeInTheDocument();
  });

  it("enables scoring keys when game systems selected", async () => {
    render(<ScoringKeySelector {...defaultProps} />);
    const user = userEvent.setup();

    expect(
      screen.getByRole("combobox", { name: "Scoring Key" }),
    ).toBeDisabled();

    const gameSystemSelect = screen.getByRole("combobox", {
      name: "Game System",
    });

    await user.selectOptions(gameSystemSelect, "Test 1");

    expect(
      screen.getByRole("combobox", { name: "Scoring Key" }),
    ).not.toBeDisabled();
  });

  it("resets scoring key when selecting different game system", async () => {
    render(<ScoringKeySelector {...defaultProps} />);
    const user = userEvent.setup();

    const gameSystemSelect = screen.getByRole("combobox", {
      name: "Game System",
    });
    const scoringKeysSelect = screen.getByRole("combobox", {
      name: "Scoring Key",
    });

    await user.selectOptions(gameSystemSelect, "Test 1");
    await user.selectOptions(scoringKeysSelect, "Key 1.2");

    expect(scoringKeysSelect).toHaveValue("Key 1.2");

    await user.selectOptions(gameSystemSelect, "Test 2");

    expect(scoringKeysSelect).toHaveValue("");
  });

  describe("with selected values", () => {
    it("renders", () => {
      render(
        <ScoringKeySelector
          {...defaultProps}
          selectedScoringKey="Key 1.1"
          selectedGameSystemId="1"
        />,
      );

      expect(screen.getByRole("combobox", { name: "Game System" })).toHaveValue(
        "1",
      );

      expect(screen.getByRole("combobox", { name: "Scoring Key" })).toHaveValue(
        "Key 1.1",
      );
    });
  });
});
