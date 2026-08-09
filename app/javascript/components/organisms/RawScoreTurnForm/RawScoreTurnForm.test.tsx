import { render, screen } from "@testing-library/react";
import { RawScoreTurnForm } from ".";
import userEvent from "@testing-library/user-event";
import { gameSystemFactory, playerFactory } from "Test/factories";

describe("RawScoreTurnForm", () => {
  const gameSystem = gameSystemFactory.build();

  describe("New game", () => {
    const players = [
      playerFactory.build({ displayName: "Player 1" }),
      playerFactory.build({ displayName: "Player 2" }),
    ];

    it("renders key parts", () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      expect(screen.getByText("Turn")).toBeInTheDocument();
      expect(screen.getByText("Player 1")).toBeInTheDocument();
      expect(screen.getByText("Player 2")).toBeInTheDocument();

      expect(screen.getByRole("button", { name: "Add Turn" })).toBeInTheDocument();
    });

    it("total scores are correct", () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("0");
      expect(screen.getByTestId("total-score-1")).toHaveTextContent("0");

      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("0");

      expect(screen.getByTestId("primary-summary-1")).toHaveTextContent("0");
      expect(screen.getByTestId("secondary-summary-1")).toHaveTextContent("0");
    });

    it("clicking Add turn adds new row", async () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button"));

      // 2 players, two scoring objectives
      expect(screen.getAllByRole("textbox")).toHaveLength(4);
    });

    it("adding new row, and adding new scores updates totals", async () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button"));

      await user.type(screen.getByTestId("input-primary-turn-1-player-0"), "5");
      await user.type(screen.getByTestId("input-secondary-turn-1-player-0"), "2");

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("7");
      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("5");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("2");
    });
  });

  describe("Previous game", () => {
    const players = [
      playerFactory.build({
        displayName: "Player 1",
        turns: [
          { primary: 10, secondary: 5 },
          { primary: 4, secondary: 2 },
        ],
      }),
      playerFactory.build({
        displayName: "Player 2",
        turns: [
          { primary: 1, secondary: 4 },
          { primary: 8, secondary: 3 },
        ],
      }),
    ];

    it("renders key parts", () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      expect(screen.getByText("Turn")).toBeInTheDocument();
      expect(screen.getByText("Player 1")).toBeInTheDocument();
      expect(screen.getByText("Player 2")).toBeInTheDocument();

      expect(screen.getByRole("button", { name: "Add Turn" })).toBeInTheDocument();

      expect(screen.getAllByRole("textbox")).toHaveLength(8);
    });

    it("total scores are correct", () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("21");
      expect(screen.getByTestId("total-score-1")).toHaveTextContent("16");

      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("14");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("7");

      expect(screen.getByTestId("primary-summary-1")).toHaveTextContent("9");
      expect(screen.getByTestId("secondary-summary-1")).toHaveTextContent("7");
    });

    it("clicking Add turn adds new row", async () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button"));

      // 2 players, two scoring objectives
      expect(screen.getAllByRole("textbox")).toHaveLength(12);
    });

    it("adding new row, and adding new scores updates totals", async () => {
      render(<RawScoreTurnForm players={players} gameSystem={gameSystem} editable={true} />);
      const user = userEvent.setup();

      await user.click(screen.getByRole("button"));

      await user.type(screen.getByTestId("input-primary-turn-3-player-0"), "5");
      await user.type(screen.getByTestId("input-secondary-turn-3-player-0"), "2");

      expect(screen.getByTestId("total-score-0")).toHaveTextContent("28");
      expect(screen.getByTestId("primary-summary-0")).toHaveTextContent("19");
      expect(screen.getByTestId("secondary-summary-0")).toHaveTextContent("9");
    });
  });
});
