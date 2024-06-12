import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'surrenderCheckBox', 'surrenderSection' ]

  finishChosen(event) {
    const selectedValue = event.target.value;
    if(selectedValue == "Player Surrender"){
      this.surrenderSectionTarget.classList.add('surrender-selection--show');
    } else {
      this.surrenderCheckBoxTargets.forEach((item) => {
        item.checked = false;
      });
      this.surrenderSectionTarget.classList.remove('surrender-selection--show');
    }
  }
}
