
export abstract class Drawing<T> {
  abstract processClick(event: Position): void;
  abstract cancelDrawing(): void;
  abstract finishDrawing(): T;
}

export interface Position {
  x: number;
  y: number;
}
