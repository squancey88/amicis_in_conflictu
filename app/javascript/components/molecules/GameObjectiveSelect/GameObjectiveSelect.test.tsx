import { render, screen } from "@testing-library/react";
import { GameObjectiveSelect } from ".";
import { gameObjectiveFactory } from "Test/factories";

describe("GameObjectiveSelect", () => {
  const gameObjectives = gameObjectiveFactory.buildList(2);

  it("renders", () => {
    render(<GameObjectiveSelect fieldName="test" gameObjectives={gameObjectives} />);

    expect(screen.getByRole("combobox")).toBeInTheDocument();
    expect(screen.getAllByRole("option")).toHaveLength(3);
  });
});
