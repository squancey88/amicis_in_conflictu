import { Controller } from "@hotwired/stimulus";
import { Drawing, Position } from "./drawing_controllers/drawing";
import { PolygonDrawing } from "./drawing_controllers/polygon";

export default class extends Controller<HTMLFormElement> {
  static targets = ["editorSvg", "inProgressItem", "newItems", "defaultControls", "drawingControls"];

  internalTarget = 1000;

  viewBox = {
    x: 0,
    y: 0,
    internalX: this.internalTarget,
    internalY: this.internalTarget
  }

  mode = Modes.STANDARD;

  tracking: any;
  
  toBeSaved: any[] = [];
  drawingController: Drawing<any>; 

  connect() {
    console.log("Map editor starting")
    this.updateViewBox();
  }

  updateViewBox() {
    const rect = this.editorSvgTarget.getBoundingClientRect();
    const ratio = rect.height / rect.width;
    this.viewBox.internalY = ratio * this.internalTarget;

    this.editorSvgTarget.setAttribute("viewBox",
      `${this.viewBox.x} ${this.viewBox.y} ${this.viewBox.internalX} ${this.viewBox.internalY}`
    )
  }

  svgClick(event: MouseEvent) {
    const position = this.scaleClick(event);
    switch(this.mode) {
      case Modes.DRAWING:
        this.drawingController.processClick(position);
        break;
    }
  }

  scaleClick(event: MouseEvent): Position {
    const pos = this.relativeMouse(event);
    console.log(pos);
    return pos;
  }

  svgMove(event: MouseEvent) {
    const edgeData = this.edgeDetect(event);
    if(edgeData.nearEdge) {
      if (edgeData.nearBottom) { 
        this.viewBox.y += 1;
      } else if (edgeData.nearTop) {
        this.viewBox.y -= 1;
      } else if (edgeData.nearLeft) {
        this.viewBox.x -= 1;
      } else if (edgeData.nearRight) {
        this.viewBox.x += 1;
      }
    }
    this.updateViewBox();
  }

  svgWheel(event: WheelEvent) {
    console.log(event.deltaY);
  }

  addToEditor(element: HTMLElement) {
    console.log(element);
    this.editorSvgTarget.appendChild(element);
  }

  newPolygon() {
    this.mode = Modes.DRAWING;
    this.drawingController = new PolygonDrawing(this);
    this.toggleDrawingControls();
  }

  finishDrawing() {
    const item = this.drawingController.finishDrawing();
    this.saveItem(item); 
    this.toggleDrawingControls();
    this.mode = Modes.STANDARD;
  }

  cancelDrawing() {
    this.drawingController.cancelDrawing();
    this.toggleDrawingControls();
    this.mode = Modes.STANDARD;
  }

  generateId(): string {
    return `newItem-${this.toBeSaved.length}`;
  }

  private saveItem(item: any) {
    this.inProgressItemTarget.id = item.id;
    this.inProgressItemTarget.dataset.mapEditorTarget = "newItems";
    this.toBeSaved.push(item);
  } 

  private toggleDrawingControls() { 
    console.log("Toggling classes");
    this.defaultControlsTarget.classList.toggle("hide");
    this.drawingControlsTarget.classList.toggle("hide");
  }

  private relativeMouse(event: MouseEvent): Position {
    const rect = this.editorSvgTarget.getBoundingClientRect();
    const x = event.clientX;
    const y = event.clientY;
    return { x: x - rect.left, y: y - rect.top };
  }

  private edgeDetect(event: MouseEvent, padding=5) {
    const rect = this.editorSvgTarget.getBoundingClientRect();
    const x = event.clientX;
    const y = event.clientY;

    const inside =
      x >= rect.left &&
      x <= rect.right &&
      y >= rect.top &&
      y <= rect.bottom;

    if (!inside) {
      return {
        inside: false,
        nearEdge: false,
        nearLeft: false,
        nearRight: false,
        nearTop: false,
        nearBottom: false
      };
    }

    const distLeft   = x - rect.left;
    const distRight  = rect.right - x;
    const distTop    = y - rect.top;
    const distBottom = rect.bottom - y;

    const nearLeft   = distLeft   <= padding;
    const nearRight  = distRight  <= padding;
    const nearTop    = distTop    <= padding;
    const nearBottom = distBottom <= padding;

    return {
      inside,
      nearEdge: nearLeft || nearRight || nearTop || nearBottom,
      nearLeft,
      nearRight,
      nearTop,
      nearBottom
    };
  }
}

enum Modes {
  STANDARD = "standard",
  DRAWING = "drawing",
}

