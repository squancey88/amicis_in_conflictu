import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["armyTemplate", "armyRow", "armySelect", "armiesList"];

  armyIndex = 0;

  connect(){
    this.armyIndex = this.armyRowTargets.length;
  }

  addArmy() {
    const id = this.armySelectTarget.value;
    const index = this.armySelectTarget.selectedIndex;
    const option = this.armySelectTarget.options[index];
    const type = option.dataset.controllerType;

    const template = this.armyTemplateTarget;
    let content = template.innerHTML.replace(/%ARMY_INDEX%/g, this.armyIndex);
    content = content.replace(/%NAME%/g, option.text)
    content = content.replace(/%ID%/g, id)
    this.armiesListTarget.insertAdjacentHTML('beforeend', content);

    this.armyIndex++
  }

  removeArmy({params}) {
    const index = params.armyIndex;
    this.armyRowTargets.forEach(record => {
      if(record.dataset.armyIndex == index) {
        record.remove();
      }
    })
  }
}