export interface QuestEventData {
  id: string;
  title: string;
  details: string;
  order: number;
  type: string;
}

export interface QuestEventDataTextSection extends QuestEventData {
  content: string;
}
