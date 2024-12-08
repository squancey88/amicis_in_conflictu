import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['campaignSelect', 'armySelect', 'gameSystemSelect'];
  static values = {
    currentUserId: String
  }
  
  gameSystemSelected(event){
    console.log(event);
    if(event.target.value){
      fetch('/users/'+ this.currentUserIdValue + '/campaigns.json?filter[game_system_id]='+event.target.value).then(
        (response) => {
          response.json().then((campaigns) => this.setCampaigns(campaigns));
        }
      )
      fetch('/armies.json?game_system_id='+event.target.value).then(
        (response) => {
          response.json().then((armies) => this.setArmies(armies));
        }
      )
    }
  }

  setArmies(armies) {
    this.armySelectTarget.options.length = 0;

    armies.forEach((army) => {
      const option = document.createElement("option");
      option.text = army.name;
      option.value = army.id;
      this.armySelectTarget.appendChild(option);
    });
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
  }
}