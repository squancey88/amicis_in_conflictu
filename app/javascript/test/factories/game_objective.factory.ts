import { Factory } from "fishery";
import { GameObjective } from "Types/common";
import { faker } from "@faker-js/faker";

export const gameObjectiveFactory = Factory.define<Required<GameObjective>>(() => ({
  id: faker.string.uuid(),
  name: faker.lorem.words(3),
  scoringKey: "primary",
  createdAt: faker.date.past().toUTCString(),
  updatedAt: faker.date.past().toUTCString(),
}));
