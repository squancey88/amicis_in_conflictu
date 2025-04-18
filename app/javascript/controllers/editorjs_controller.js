import { Controller } from "@hotwired/stimulus"
import EditorJS from '@editorjs/editorjs';
import Header from '@editorjs/header';

export default class extends Controller {

  static targets = ['editor', 'formField'];

  connect() {
    let initialState; 
    if(this.formFieldTarget.value) {
      initialState = JSON.parse(this.formFieldTarget.value);
    } else {
      initialState = {} 
    }

    this.editor = new EditorJS({
      holder: this.editorTarget,
      data: initialState,
      tools: {
        header: Header,
      },
      onChange: (api, event) => {
        this.save();
      }
    });

  }

  save() {
    this.editor.save().then((outputData) => {
      this.formFieldTarget.value = JSON.stringify(outputData);
    });
  }
}
