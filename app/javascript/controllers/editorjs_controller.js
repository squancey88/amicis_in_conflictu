import { Controller } from "@hotwired/stimulus"
import EditorJS from '@editorjs/editorjs';
import Header from '@editorjs/header';
import LinkAutocomplete from '@editorjs/link-autocomplete';
import EditorjsList from '@editorjs/list';

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
        link: {
          class: LinkAutocomplete,
          config: {
            endpoint: '/text_editor/link',
            queryParam: 'search'
          }
        },
        list: {
          class: EditorjsList,
          inlineToolbar: true,
          config: {
            defaultStyle: 'unordered'
          },
        },
      },
      onChange: (api, event) => {
        this.save();
      }
    });

  }

  save() {
    this.editor.save().then((outputData) => {
      this.formFieldTarget.value = JSON.stringify(outputData);
      this.dispatch('editorSave')
    });
  }
}
