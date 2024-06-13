import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["armyTemplate", "armyRow", "armySelect", "armiesList"];
  static values = { playerIndex: Number }

  armyIndex = 0;

  connect(){
    this.armyIndex = this.armyRowTargets.length;
  }

  addArmy() {
    const id = this.armySelectTarget.value;
    const index = this.armySelectTarget.selectedIndex;
    const option = this.armySelectTarget.options[index];
    const canHaveList = option.dataset.hasLists;

    if(canHaveList){
      fetch("/armies/"+id+"/army_lists.json").then((response) => {
        response.json().then((armyLists) => {
          this.drawArmyRow(id, option.text, armyLists);
        });
      });
    } else {
      this.drawArmyRow(id, option.text);
    }
  }

  paramName(variableName){
    return "game[players_attributes][" + this.playerIndexValue + "][player_armies_attributes]["+ this.armyIndex +"]["+ variableName +"]";
  }

  drawArmyRow(id, name, lists=null){
    let content = this.armyTemplateTarget.content.cloneNode(true);

    const input = content.querySelector('input');
    input.name = this.paramName("army_id");
    input.value = id;

    const cells = content.querySelectorAll('td')
    content.querySelector('.army-row').dataset.armyIndex = this.armyIndex;
    cells[0].innerText = name;
    content.querySelector('button').dataset.armySelectorArmyIndexParam = this.armyIndex;

    if(lists.length > 0) {
      cells[1].appendChild(this.createArmyListSelect(lists));
    }

    this.armiesListTarget.appendChild(content);
    this.armyIndex++
  }

  createArmyListSelect(lists){
    const select = document.createElement('select');
    select.name = this.paramName("army_list_id");
    select.classList.add('form-select');

    const blankOption = document.createElement('option');
    blankOption.innerText = "== No List ==";
    select.appendChild(blankOption);

    lists.forEach((item) => {
      const option = document.createElement('option');
      option.value = item.id;
      option.innerText = item.name;
      select.appendChild(option);
    });
    return select;
  }

  removeArmy({params}) {
    const index = params.armyIndex;
    this.armyRowTargets.forEach(record => {
      if(record.dataset.armyIndex == index) {
        const deleteInput = record.querySelector('input[name*="_destroy"]');
        if(deleteInput) {
          deleteInput.value = 1;
          record.classList.add('army-row--to-remove');
        } else {
          record.remove();
        }
      }
    })
  }
}