import { Controller } from "@hotwired/stimulus"
import EditorJS from '@editorjs/editorjs';
import Header from '@editorjs/header';
import AutoLink from '../modules/editorjs/autolink';
import EditorjsList from '@editorjs/list';

export default class extends Controller {

  static targets = ['editor', 'formField'];
  static values = {
    minHeight: { type: Number, default: 200 },
    searchParams: { type: Object, default: {} }
  }

  connect() {
    let initialState; 
    if(this.formFieldTarget.value) {
      initialState = JSON.parse(this.formFieldTarget.value);
    } else {
      initialState = {} 
    }

    this.editor = new EditorJS({
      holder: this.editorTarget,
      minHeight: this.minHeightValue,
      data: initialState,
      tools: {
        header: Header,
        link: {
          class: AutoLink,
          config: {
            endpoint: '/text_editor/link',
            queryParam: 'search',
            additionalParams: this.searchParamsValue
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
