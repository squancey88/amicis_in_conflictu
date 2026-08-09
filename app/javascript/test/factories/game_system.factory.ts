import { Factory } from "fishery";
import { GameSystem } from "Types/common";
import { faker } from "@faker-js/faker";

export const gameSystemFactory = Factory.define<Required<GameSystem>>(() => ({
  id: faker.string.uuid(),
  name: faker.lorem.words(3),
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
  gameObjectives: [],
  createdAt: faker.date.past().toUTCString(),
  updatedAt: faker.date.past().toUTCString(),
}));
