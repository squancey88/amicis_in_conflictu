import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['playerSelect']

  players = [];
  playerIndex = 0;

  connect() {
  }

  addPlayer() {
    const id = this.playerSelectTarget.value;
    const index = this.playerSelectTarget.selectedIndex;
    const option = this.playerSelectTarget.options[index];
    const type = option.dataset.controllerType;


    const playerDiv = document.getElementById('players');

    const player = document.createElement('div');
    player.classList.add('player-selection');

    const name = document.createElement('div')
    var content = document.createTextNode(option.text);
    name.appendChild(content);

    const delBtnWrap = document.createElement('div');
    const btn = document.createElement('button');
    btn.classList.add('btn');

    const icon = document.createElement('i')
    icon.classList.add('bi', 'bi-trash3')
    btn.appendChild(icon);
    delBtnWrap.appendChild(btn);

    const idInput = document.createElement("input");
    idInput.type = "hidden";
    idInput.name = "game[players_attributes]["+this.playerIndex+"][controller_id]";
    idInput.value = id;

    const typeInput = document.createElement("input");
    typeInput.type = "hidden";
    typeInput.name = "game[players_attributes]["+this.playerIndex+"][controller_type]";
    typeInput.value = type;

    player.appendChild(name);
    player.appendChild(delBtnWrap);
    player.appendChild(idInput);
    player.appendChild(typeInput);
    playerDiv.appendChild(player)

    this.players.push({ id: id, type: type });
    this.playerIndex++
  }
}
