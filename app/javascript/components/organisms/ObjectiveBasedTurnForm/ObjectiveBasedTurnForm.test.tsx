import { render, screen, within } from "@testing-library/react";
import { ObjectiveBasedTurnForm } from ".";
import userEvent from "@testing-library/user-event";
import type { Player } from "Types/common";
import { gameObjectiveFactory, gameSystemFactory, playerFactory, turnObjectiveFactory } from "Test/factories";

describe("ObjectiveBasedTurnForm", () => {
  const objective1 = gameObjectiveFactory.build({ scoringKey: "secondary", name: "Beacon", id: "go-beacon" });
  const objective2 = gameObjectiveFactory.build({ scoringKey: "primary", name: "Purge", id: "go-purge" });
  const gameSystem = gameSystemFactory.build({ gameObjectives: [objective1, objective2] });

  describe("New game", () => {
    const players = [
      playerFactory.build({ displayName: "Player 1" }),
      playerFactory.build({ displayName: "Player 2" }),
    ];

    it("renders key parts", () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);

      expect(screen.getByText("Turn")).toBeInTheDocument();
      expect(screen.getByText("Player 1")).toBeInTheDocument();
      expect(screen.getByText("Player 2")).toBeInTheDocument();

      expect(screen.getByRole("button", { name: "Add Turn" })).toBeInTheDocument();
    });

    it("clicking Add turn adds new row", async () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      expect(screen.getAllByRole("combobox").length).toBe(2);
    });

    it("total scores are correct", () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("0");
      expect(screen.getByTestId("total-score-1")).toHaveTextContent("0");

      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("0");

      expect(screen.getByTestId("primary-summary-1")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-1")).toHaveTextContent("0");
    });

    it("adding new role and selecting objective adds input box", async () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      const player0Turn1Selector = screen.getByTestId("player-0-turn-1-selector");

      await user.selectOptions(within(player0Turn1Selector).getByRole("combobox"), "Beacon");
      await user.click(within(player0Turn1Selector).getByRole("button"));

      await user.type(screen.getByTestId("input-player-0-turn-1-objective-go-beacon"), "4");

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("4");
      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("4");

      const player1Turn1Selector = screen.getByTestId("player-1-turn-1-selector");

      await user.selectOptions(within(player1Turn1Selector).getByRole("combobox"), "Purge");
      await user.click(within(player1Turn1Selector).getByRole("button"));

      await user.type(screen.getByTestId("input-player-1-turn-1-objective-go-purge"), "9");

      expect(screen.getByTestId("total-score-1")).toHaveTextContent("9");
      expect(screen.getByTestId("primary-summary-1")).toHaveTextContent("9");
      expect(screen.getByTestId("secondary-summary-1")).toHaveTextContent("0");
    });
  });

  describe("In progress game", () => {
    const players: Array<Required<Player>> = [
      playerFactory.build({
        displayName: "Player 1",
        turnObjectives: [turnObjectiveFactory.build({ gameObjective: objective1, turn: 1, pointsScored: 4 })],
      }),
      playerFactory.build({
        displayName: "Player 2",
        turnObjectives: [turnObjectiveFactory.build({ gameObjective: objective2, turn: 1, pointsScored: 7 })],
      }),
    ];

    it("renders key parts", () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);

      expect(screen.getByText("Turn")).toBeInTheDocument();
      expect(screen.getByText("Player 1")).toBeInTheDocument();
      expect(screen.getByText("Player 2")).toBeInTheDocument();

      expect(screen.getByRole("button", { name: "Add Turn" })).toBeInTheDocument();
    });

    it("clicking Add turn adds new row", async () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      expect(screen.getAllByRole("combobox").length).toBe(4);
    });

    it("total scores are correct", () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("4");
      expect(screen.getByTestId("total-score-1")).toHaveTextContent("7");

      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("4");

      expect(screen.getByTestId("primary-summary-1")).toHaveTextContent("7");
      expect(screen.getByTestId("secondary-summary-1")).toHaveTextContent("0");
    });

    it("adding new role and selecting objective adds input box", async () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      const player0Turn2Selector = screen.getByTestId("player-0-turn-2-selector");

      await user.selectOptions(within(player0Turn2Selector).getByRole("combobox"), "Beacon");
      await user.click(within(player0Turn2Selector).getByRole("button"));

      expect(screen.getAllByRole("textbox")).toHaveLength(3);
    });

    it("adding new role and selecting objective and adding score updates total", async () => {
      render(<ObjectiveBasedTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button", { name: "Add Turn" }));

      const player1Turn2Selector = screen.getByTestId("player-1-turn-2-selector");

      await user.selectOptions(within(player1Turn2Selector).getByRole("combobox"), "Beacon");
      await user.click(within(player1Turn2Selector).getByRole("button"));

      await user.type(screen.getByTestId("input-player-1-turn-2-objective-go-beacon"), "9");

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("4");
      expect(screen.getByTestId("total-score-1")).toHaveTextContent("16");

      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("4");

      expect(screen.getByTestId("primary-summary-1")).toHaveTextContent("7");
      expect(screen.getByTestId("secondary-summary-1")).toHaveTextContent("9");
    });
  });
});
