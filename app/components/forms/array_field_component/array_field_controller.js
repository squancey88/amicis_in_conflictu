import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["rowTemplate", "fieldsWrapper", "field", "message"] 
  static values = {
    required: { type: Boolean, default: false }
  }

  addNewRow() { 
    const template = this.rowTemplateTarget.content.cloneNode(true); 
    this.fieldsWrapperTarget.appendChild(template);
  }

  removeRow(e) {
    if(this.requiredValue && this.fieldTargets.length > 1) {
      e.currentTarget.parentElement.remove();
    } else {
      e.currentTarget.parentElement.remove();
    }
  }


}
