import { ComponentProps } from "react";
import { render, screen } from "@testing-library/react";
import { ScoringKeySelector } from ".";
import userEvent from "@testing-library/user-event";
import { gameSystemFactory } from "Test/factories";

describe("ScoringKeySelector", () => {
  const gameSystem1 = gameSystemFactory.build({
    name: "Test 1",
    scoringValues: [
      { name: "Key 1.1", key: "key1.1", type: "number", scoring: true },
      { name: "Key 1.2", key: "key1.2", type: "number", scoring: true },
    ],
  });
  const defaultProps: ComponentProps<typeof ScoringKeySelector> = {
    modelName: "game_objective",
    groupedGameSystems: [
      {
        groupName: "Test",
        gameSystems: [
          gameSystem1,
          gameSystemFactory.build({
            name: "Test 2",
            scoringValues: [
              { name: "Key 2.1", key: "key2.1", type: "number", scoring: true },
              { name: "Key 2.2", key: "key2.2", type: "number", scoring: true },
            ],
          }),
        ],
      },
    ],
  };

  it("renders", () => {
    render(<ScoringKeySelector {...defaultProps} />);

    expect(screen.getByRole("combobox", { name: "Game System" })).toBeInTheDocument();

    expect(screen.getByRole("combobox", { name: "Scoring Key" })).toBeInTheDocument();
  });

  it("enables scoring keys when game systems selected", async () => {
    render(<ScoringKeySelector {...defaultProps} />);
    const user = userEvent.setup();

    expect(screen.getByRole("combobox", { name: "Scoring Key" })).toBeDisabled();

    const gameSystemSelect = screen.getByRole("combobox", {
      name: "Game System",
    });

    await user.selectOptions(gameSystemSelect, "Test 1");

    expect(screen.getByRole("combobox", { name: "Scoring Key" })).not.toBeDisabled();
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

    expect(scoringKeysSelect).toHaveValue("key1.2");

    await user.selectOptions(gameSystemSelect, "Test 2");

    expect(scoringKeysSelect).toHaveValue("");
  });

  describe("with selected values", () => {
    it("renders", () => {
      render(
        <ScoringKeySelector {...defaultProps} selectedScoringKey="key1.1" selectedGameSystemId={gameSystem1.id} />,
      );

      expect(screen.getByRole("combobox", { name: "Game System" })).toHaveValue(gameSystem1.id);

      expect(screen.getByRole("combobox", { name: "Scoring Key" })).toHaveValue("key1.1");
    });

    it("can select new key", async () => {
      render(
        <ScoringKeySelector {...defaultProps} selectedScoringKey="key1.1" selectedGameSystemId={gameSystem1.id} />,
      );

      const user = userEvent.setup();
      const gameSystemSelect = screen.getByRole("combobox", {
        name: "Game System",
      });
      const scoringKeysSelect = screen.getByRole("combobox", {
        name: "Scoring Key",
      });
      expect(gameSystemSelect).toHaveValue(gameSystem1.id);

      await user.selectOptions(scoringKeysSelect, "Key 1.2");
      expect(scoringKeysSelect).toHaveValue("key1.2");
    });
  });
});
