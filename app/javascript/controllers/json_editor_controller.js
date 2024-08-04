import { Controller } from "@hotwired/stimulus"
import * as jsonEditor from '@json-editor/json-editor';

export default class extends Controller {
  static targets = ['editor', 'config'];
  static values = {
    schema: Object,
    config: Object,
  }

  connect() {
    console.log(this.schemaValue);
    console.log(this.configValue);
    console.log(this.formNameValue);
    const editor = new jsonEditor.JSONEditor(this.editorTarget, {
      startval: this.configValue,
      schema: this.schemaValue,
      theme: 'bootstrap5'
    });
    editor.on('change',() => {
      const jsonString = JSON.stringify(editor.getValue());
      this.configTarget.value = jsonString;
    });
  }

}