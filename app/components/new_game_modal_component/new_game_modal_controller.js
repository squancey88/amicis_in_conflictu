import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['playerSelect', 'playersList', 'playerTemplate', 'playerRow']

  players = [];
  playerIndex = 0;

  connect() {
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
