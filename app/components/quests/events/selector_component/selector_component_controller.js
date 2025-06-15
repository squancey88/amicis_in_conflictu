import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['eventsSelect', 'linkBtn'];
  static values = {
    gameId: String,
  }

  selectedQuest = null;
  selectedEvent = null;

  questSelected(event) {
    const selectedId = event.target.value;
    if (selectedId) {
      this.selectedQuest = selectedId;
      this.getEvents(selectedId);
    } else {
      this.selectedQuest = null;
    }
  }

  eventSelected(event) {
    const selectedId = event.target.value;
    if (selectedId) {
      this.selectedEvent = selectedId;
      this.linkBtnTarget.removeAttribute('disabled');
    } else {
      this.selectedEvent = null;
      this.disableLinkBtn();
    }
  }

  disableLinkBtn() {
    this.linkBtnTarget.setAttribute('disabled', 'disabled');
  }

  getEvents(questId) {
    this.disableLinkBtn();
    this.eventsSelectTarget.options.length = 1
    fetch(`/quests/${questId}/quest_events.json`).then(
      (response) => {
        response.json().then((events) => {
          events.forEach(questEvent => {
            const option = document.createElement("option");
            option.text = questEvent.title;
            option.value = questEvent.id;
            this.eventsSelectTarget.appendChild(option);
          })
        });
      }
    )
  }

  linkEvent() {
    console.log("creating link:", this.gameIdValue, this.selectedEvent)
    fetch(`/games/${this.gameIdValue}/link_quest_event.json`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        quest_event_id: this.selectedEvent,
      })
    }).then((response) => {
      response.json().then((body) => {
        console.log(body);
      })
    })
  }

}