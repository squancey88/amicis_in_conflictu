import { Factory } from "fishery";
import { TurnObjective } from "Types/common";
import { faker } from "@faker-js/faker";
import { gameObjectiveFactory } from "Test/factories/game_objective.factory";

export const turnObjectiveFactory = Factory.define<TurnObjective>(() => ({
  id: faker.string.uuid(),
  turn: 1,
  pointsScored: 5,
  gameObjective: gameObjectiveFactory.build(),
  createdAt: faker.date.past().toUTCString(),
  updatedAt: faker.date.past().toUTCString(),
}));
