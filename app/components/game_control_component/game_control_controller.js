import { Controller } from "@hotwired/stimulus"
import debounce from "lodash/debounce"

export default class extends Controller {
  static targets = [ "globalNotes", "globalNotesBtn", 
    "eventNotes", "eventNotesBtn", 
    "combatTracker", "combatTrackerBtn",
    "form", "status"];
  static values = {
    gameId: String,
    touched: {type: Boolean, default: false}
  }


  connect() {
    this.setupToggleBtn(this.globalNotesBtnTarget, this.globalNotesTarget);
    this.setupToggleBtn(this.eventNotesBtnTarget, this.eventNotesTarget);
    this.setupToggleBtn(this.combatTrackerBtnTarget, this.combatTrackerTarget);
    this.debouncedRequest = debounce(this.saveForm, 5000);
    this.updateStatus();
  }

  disconnect() {
    this.globalNotesBtnTarget.removeEventListener("click");
    this.eventNotesBtnTarget.removeEventListener("click");
    this.combatTrackerBtnTarget.removeEventListener("click");
  }

  touchedValueChanged() { 
    this.updateStatus();
  }

  updateStatus() {
    this.statusTarget.textContent = this.touchedValue ? "Not Synced" : "Synced";
  }

  setupToggleBtn(button, target){
    console.log(button, target);
    if(target.classList.contains("show")) {
      button.classList.add('btn-primary');
    } else {
      button.classList.remove('btn-primary');
      button.classList.add('btn-outline-primary');
    }
    button.addEventListener("click", () => {
      button.classList.toggle('btn-primary')
      button.classList.toggle('btn-outline-primary')
      target.classList.toggle('show');
    })
  }

  notesSaved() {
    console.log("notes were changed")
    this.touchedValue = true;
    this.debouncedRequest();
  }

  saveForm() {
    console.log("saving");
    const formData = new FormData(this.formTarget);

    fetch(`/games/${this.gameIdValue}`,
      {
        method: "POST",
        body: formData,
        headers: {
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").textContent,
        }
      }
    ).then((response) => {
      this.touchedValue = false;
      console.log(response)
    });
  }
}
