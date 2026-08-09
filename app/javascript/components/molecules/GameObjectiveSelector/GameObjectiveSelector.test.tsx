import { render, screen } from "@testing-library/react";
import { GameObjectiveSelector } from ".";
import { gameSystemFactory } from "Test/factories/game_system.factory";
import { gameObjectiveFactory } from "Test/factories/game_objective.factory";
import { GameObjective } from "Types/common";
import userEvent from "@testing-library/user-event";

describe("GameObjectiveSelector", () => {
  const gameObjective1 = gameObjectiveFactory.build({ scoringKey: "primary", name: "Objective 1" });
  const gameObjective2 = gameObjectiveFactory.build({ scoringKey: "primary", name: "Objective 2" });
  const gameObjective3 = gameObjectiveFactory.build({ scoringKey: "secondary", name: "Objective 3" });

  const gameSystem = gameSystemFactory.build({
    gameObjectives: [gameObjective1, gameObjective2, gameObjective3],
  });
  const onSelect = jest.fn();
  const alreadyUsed: Array<GameObjective> = [];

  afterEach(() => {
    jest.resetAllMocks();
  });

  it("can select option", async () => {
    render(
      <GameObjectiveSelector fieldName="test" gameSystem={gameSystem} alreadyUsed={alreadyUsed} onSelect={onSelect} />,
    );

    const user = userEvent.setup();
    expect(screen.getByRole("combobox")).toBeInTheDocument();

    await user.selectOptions(screen.getByRole("combobox"), "Objective 1");
    await user.click(screen.getByRole("button", { name: "Select" }));

    expect(onSelect).toHaveBeenCalledWith(gameObjective1);
  });

  it("disables options when in alreadyUsed", () => {
    render(
      <GameObjectiveSelector
        fieldName="test"
        gameSystem={gameSystem}
        alreadyUsed={[gameObjective2]}
        onSelect={onSelect}
      />,
    );

    expect(screen.getByRole("option", { name: "Objective 2" })).toBeDisabled();
    expect(screen.getByRole("option", { name: "Objective 1" })).not.toBeDisabled();
    expect(screen.getByRole("option", { name: "Objective 3" })).not.toBeDisabled();
  });
});
