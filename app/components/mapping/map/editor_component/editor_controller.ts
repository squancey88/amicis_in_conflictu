import { Controller } from "@hotwired/stimulus";

export default class extends Controller<HTMLFormElement> {
  connect() {
    console.log("Map editor starting")
  }
}
