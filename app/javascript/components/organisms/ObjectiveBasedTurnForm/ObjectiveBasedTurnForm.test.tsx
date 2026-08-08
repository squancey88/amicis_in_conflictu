import { ComponentProps } from "react";
import { render, screen, within } from "@testing-library/react";
import { ObjectiveBasedTurnForm } from ".";
import userEvent from "@testing-library/user-event";
import { GameSystem } from "Types/common";

describe("ObjectiveBasedTurnForm", () => {
  const gameSystem: Required<GameSystem> = {
    id: "1",
    name: "Test system",
    scoringValues: [
      {
        name: "Primary",
        key: "primary",
        type: "number",
        scoring: true,
      },
      {
        name: "Seconday",
        key: "secondary",
        type: "number",
        scoring: true,
      },
    ],
    gameObjectives: [
      {
        id: "go-beacon",
        name: "Beacon",
        scoringKey: "secondary",
        createdAt: "",
        updatedAt: "",
      },
    ],
    createdAt: "",
    updatedAt: "",
  };

  const newGameProps: ComponentProps<typeof ObjectiveBasedTurnForm> = {
    players: [
      {
        id: "1",
        displayName: "Player 1",
        type: "User",
        turns: [],
        turnObjectives: [],
        createdAt: "",
        updatedAt: "",
      },
      {
        id: "2",
        displayName: "Player 2",
        type: "User",
        turns: [],
        turnObjectives: [],
        createdAt: "",
        updatedAt: "",
      },
    ],
    gameSystem: gameSystem,
    editable: true,
  };

  describe("New game", () => {
    it("renders key parts", () => {
      render(<ObjectiveBasedTurnForm {...newGameProps} />);

      expect(screen.getByText("Turn")).toBeInTheDocument();
      expect(screen.getByText("Player 1")).toBeInTheDocument();
      expect(screen.getByText("Player 2")).toBeInTheDocument();

      expect(
        screen.getByRole("button", { name: "Add Turn" }),
      ).toBeInTheDocument();
    });

    it("clicking Add turn adds new row", async () => {
      render(<ObjectiveBasedTurnForm {...newGameProps} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      expect(screen.getAllByRole("combobox").length).toBe(2);
    });

    it("adding new role and selecting objective adds input box", async () => {
      render(<ObjectiveBasedTurnForm {...newGameProps} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      const player0Turn1Selector = screen.getByTestId(
        "player-0-turn-1-selector",
      );

      user.selectOptions(
        within(player0Turn1Selector).getByRole("combobox"),
        "Beacon",
      );
      user.click(within(player0Turn1Selector).getByRole("button"));

      expect(screen.getByRole("input")).toBeInTheDocument();
    });
  });
});
