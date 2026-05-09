interface BaseFields {
  id: string;
  name: string;
}

export interface GameSystem extends BaseFields {}

export interface Campaign extends BaseFields {}

export interface Player extends BaseFields {
  type: string;
  armies: Array<Army>;
}

export interface ArmyList extends BaseFields {}

export interface PlayerArmy {
  id: string;
  player: Player;
  army: Army;
  armyList: ArmyList;
}

export interface Army extends BaseFields {
  lists: Array<ArmyList>;
}

export interface GroupedGameSystems {
  groupName: string;
  gameSystems: Array<GameSystem>;
}

export interface CampaignsByGameSystem {
  gameSystemId: string;
  campaigns: Array<Campaign>;
}
