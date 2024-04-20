import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['turnGrid', 'turnCounter']

  connect() {
  }

  addTurn() {
    const turnNumber = this.turnCounterTargets.length + 1;
    const template = document.getElementById('empty-turn');
    const content = template.innerHTML.replace(/TURN_NUMBER/g, turnNumber);
    this.turnGridTarget.insertAdjacentHTML('beforeend', content);
  }

}
