export interface GameSystem {
  id: string;
  name: string;
}

export interface GroupedGameSystems {
  groupName: string;
  gameSystems: Array<GameSystem>;
}
