import { Drawing, Position } from "./drawing";

export class PolygonDrawing extends Drawing<Polygon> {
  
  controller: any;
  points: number[][] = [];

  constructor(controller: any) {
    super();
    this.controller = controller;
    const polygon = document.createElementNS("http://www.w3.org/2000/svg", "polygon");
    polygon.dataset.mapEditorTarget = "inProgressItem"
    polygon.setAttribute("fill", "none");
    polygon.setAttribute("stroke", "black");;
    this.controller.addToEditor(polygon);
  }

  processClick(event: Position) {
    const point = [event.x, event.y];
    this.points.push(point);
    this.updateElement();
  }

  cancelDrawing() {
    this.controller.inProgressItemTarget.remove();
  }

  finishDrawing(): Polygon {
    return new Polygon(this.controller.generateId(), this.points);
  }

  private updateElement() {
    const element = this.controller.inProgressItemTarget;
    element.setAttribute("points", this.points.map(([x,y]) => `${x},${y}`).join(" "));
  }
}

export class Polygon {
  id: string;
  points: number[][];

  constructor(id: string, points: number[][]) {
    this.id = id;
    this.points = points;
  }
}
