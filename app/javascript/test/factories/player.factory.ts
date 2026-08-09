import { Factory } from "fishery";
import { Player } from "Types/common";
import { faker } from "@faker-js/faker";

export const playerFactory = Factory.define<Required<Player>>(() => ({
  id: faker.string.uuid(),
  displayName: faker.lorem.words(3),
  type: "User",
  turns: [],
  turnObjectives: [],
  createdAt: faker.date.past().toUTCString(),
  updatedAt: faker.date.past().toUTCString(),
}));
