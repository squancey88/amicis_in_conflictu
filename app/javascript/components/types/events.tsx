import { AICRecord } from "./common";

export interface QuestEventData extends AICRecord {
  title: string;
  details: string;
  order: number;
  type: string;
}

export interface QuestEventDataTextSection extends QuestEventData {
  content: string;
}
