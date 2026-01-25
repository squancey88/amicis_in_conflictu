export interface GameSystem {
  id: string;
  name: string;
}

export interface Campaign {
  id: string;
  name: string;
}

export interface Player {
  name: string;
  id: string;
  type: string;
}

export interface GroupedGameSystems {
  groupName: string;
  gameSystems: Array<GameSystem>;
}

export interface CampaignsByGameSystem {
  gameSystemId: string;
  campaigns: Array<Campaign>;
}
