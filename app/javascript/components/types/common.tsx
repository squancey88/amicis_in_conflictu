export interface GameSystem extends AICRecord {
  name: string;
  scoringKeys?: Array<string>;
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
  id: string;
  type: string;
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
  created_at: string;
  updated_at: string;
}

export type MapTypes = "hex_grid" | "hex_diamond" | "svg";
