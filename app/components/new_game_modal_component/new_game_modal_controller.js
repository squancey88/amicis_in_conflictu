import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['playerSelect', 'playersList', 'playerTemplate', 'playerRow', 'campaignSelect', 'submitBtn']
  static values = {
    gamingGroupId: String
  }

  players = [];
  playerIndex = 0;

  connect() {
  }

  gameSystemSelected(event){
    this.submitBtnTarget.disabled = true;
    if(event.target.value){
      fetch('/gaming_groups/'+ this.gamingGroupIdValue + '/campaigns.json?filter[game_system_id]='+event.target.value).then(
        (response) => {
          response.json().then((campaigns) => this.setCampaigns(campaigns));
        }
      )
    }
  }

  setCampaigns(campaigns){
    this.campaignSelectTarget.options.length = 0;

    const option = document.createElement("option");
    option.text = 'No Campaign'
    option.value = null;
    this.campaignSelectTarget.appendChild(option);
    campaigns.forEach((campaign) => {
      const option = document.createElement("option");
      option.text = campaign.name;
      option.value = campaign.id;
      this.campaignSelectTarget.appendChild(option);
    });
    this.submitBtnTarget.disabled = false;
  }

  removePlayer({params}) {
    const index = params.playerIndex;
    this.players.splice(index, 1)
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

    const template = this.playerTemplateTarget;
    let content = template.innerHTML.replace(/%PLAYER_INDEX%/g, this.playerIndex);
    content = content.replace(/%ID%/g, id)
    content = content.replace(/%TYPE%/g, type)
    content = content.replace(/%NAME%/g, option.text)
    this.playersListTarget.insertAdjacentHTML('beforeend', content);

    this.players.push({ id: id, type: type });
    this.playerIndex++
  }
}
