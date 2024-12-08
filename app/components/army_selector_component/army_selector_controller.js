import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["armyTemplate", "armyRow"];
  static values = { playerIndex: Number }

  connect(){
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