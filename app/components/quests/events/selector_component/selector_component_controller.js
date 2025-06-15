import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['questsSelect', 'eventsSelect', 'linkBtn'];
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
    fetch(`/quests/${questId}/quest_events.json?game_id=${this.gameIdValue}`).then(
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
    const formData = new FormData()
    formData.append('quest_event_id', this.selectedEvent);

    console.log("creating link:", this.gameIdValue, this.selectedEvent)
    fetch(`/games/${this.gameIdValue}/link_quest_event`, {
      method: "POST",
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: formData
    })
    .then(r => r.text())
    .then(html => {
      Turbo.renderStreamMessage(html);
      this.questsSelectTarget.selectedIndex = 0;
      this.eventsSelectTarget.selectedIndex = 0;
      this.eventsSelectTarget.options.length = 1;
    })
  }

}
