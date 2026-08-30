export interface GameObjective extends AICRecord {
  name: string;
  scoringKey: string;
}

export interface TurnObjective extends AICRecord {
  turn: number;
  pointsScored: number;
  gameObjective: GameObjective;
}

export interface GameSystem extends AICRecord {
  name: string;
  gameObjectives?: Array<GameObjective>;
  scoringValues?: Array<{
    name: string;
    key: string;
    scoring: boolean;
    type: string;
  }>;
}

export interface Campaign extends AICRecord {
  name: string;
}

export interface Player extends AICRecord {
  type: string;
  displayName: string;
  turns?: Array<Record<string, number>>;
  turnObjectives?: Array<TurnObjective>;
}

export interface User extends AICRecord {
  displayName: string;
}

export interface Team extends AICRecord {
  displayName: string;
}

export interface GroupedGameSystems {
  groupName: string;
  gameSystems: Array<GameSystem>;
}

export interface CampaignsByGameSystem {
  gameSystemId: string;
  campaigns: Array<Campaign>;
}

export interface AICRecord {
  id: string;
  createdAt: string;
  updatedAt: string;
}

export type MapTypes = "hex_grid" | "hex_diamond" | "svg";
