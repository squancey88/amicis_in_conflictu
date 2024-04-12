import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ['turnRows', 'turnRow'];

  connect() {
  }

  addTurn() {
    const turnNumber = this.turnRowTargets.length + 1;
    const template = document.getElementById('empty-turn');
    const content = template.innerHTML.replace(/TURN_NUMBER/g, turnNumber);
    this.turnRowsTarget.insertAdjacentHTML('beforeend', content);
  }

}
