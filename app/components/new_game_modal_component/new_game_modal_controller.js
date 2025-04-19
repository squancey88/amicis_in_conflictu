import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
  static targets = ['playerSelect', 'playersList', 'playerTemplate', 'playerRow', 'campaignSelect', 'submitBtn', 'gameSystemSelect']
  static values = {
    gamingGroupId: String
  }

  groupUrl = '';

  connect() {
    this.groupUrl = '/gaming_groups/'+ this.gamingGroupIdValue;
  }

  playerRowTargetConnected(element){
    this.checkValid();
  }

  playerRowTargetDisconnected(element){
    this.checkValid();
  }

  
  checkValid() {
    console.log('checking valid', this.playerRowTargets.length)
    if(this.playerRowTargets.length > 0 && this.gameSystemSelectTarget.value) {
      this.submitBtnTarget.disabled = false;
    } else {
      this.submitBtnTarget.disabled = true;
    }
  }

  gameSystemSelected(event) {
    if(event.target.value){
      fetch(this.groupUrl + '/campaigns.json?filter[game_system_id]='+event.target.value).then(
        (response) => {
          response.json().then((campaigns) => this.setCampaigns(campaigns));
        }
      );
    } 
    this.checkValid();
  }

  setCampaigns(campaigns) {
    this.campaignSelectTarget.options.length = 0;

    const option = document.createElement("option");
    option.text = 'No Campaign'
    option.value = '';
    this.campaignSelectTarget.appendChild(option);
    campaigns.forEach((campaign) => {
      const option = document.createElement("option");
      option.text = campaign.name;
      option.value = campaign.id;
      this.campaignSelectTarget.appendChild(option);
    });
  }

  campaignSelected(event) {
    if(event.target.value){ 
      console.log(event.target.value)
      fetch(`${this.groupUrl}/campaigns/${event.target.value}/add_players_row`, {
        method: "GET",
      })
      .then(r => r.text())
      .then(html => {
        Turbo.renderStreamMessage(html);
      })
    }
  }
  
  clearForm() {
    this.gameSystemSelectTarget.selectedIndex = 0;
    this.campaignSelectTarget.selectedIndex = 0;
    this.campaignSelectTarget.options.length = 1;
    this.clearPlayers();
  }

  clearPlayers() {
    this.playerRowTargets.forEach(record => record.remove());
  }

  removePlayer({params}) {
    const index = params.playerIndex;
    this.playerRowTargets.forEach(record => {
      if(record.dataset.playerIndex == index) {
        record.remove();
      }
    })
  }

  addPlayer() {
    const id = this.playerSelectTarget.value;
    const index = this.playerSelectTarget.selectedIndex;
    const option = this.playerSelectTarget.options[index];
    const type = option.dataset.controllerType;
    const params = new URLSearchParams();
    params.append("controller_id", id)
    params.append("type", type)
    fetch(`/players/add_player_row?${params}`, {
      method: "GET",
    })
    .then(r => r.text())
    .then(html => {
      Turbo.renderStreamMessage(html);
    })
  }
}
