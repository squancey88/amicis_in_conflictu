import React from "react";
import { useEffect, useRef } from "react";
import EditorJS, { OutputData } from "@editorjs/editorjs";
import Header from "@editorjs/header";
import AutoLink from "Modules/editorjs/autolink";
import EditorjsList from "@editorjs/list";

interface TextEditorProps {
  label: string;
  fieldName: string;
  minHeight?: number;
  initialValue?: string;
  searchParams?: Record<string, string>;
  onChange?: (data: OutputData) => void;
}

const TextEditor = ({
  label,
  fieldName,
  initialValue,
  minHeight,
  onChange,
  searchParams,
}: TextEditorProps) => {
  const editorRef = useRef<EditorJS | null>(null);
  const holderRef = useRef<HTMLDivElement>(null);
  const hiddenInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (!holderRef.current) return;

    let initialState: OutputData = {} as OutputData;
    if (initialValue) {
      try {
        initialState = JSON.parse(initialValue);
      } catch {
        initialState = {} as OutputData;
      }
    }

    editorRef.current = new EditorJS({
      holder: holderRef.current,
      minHeight,
      data: initialState,
      tools: {
        header: Header,
        link: {
          class: AutoLink,
          config: {
            endpoint: "/text_editor/link",
            queryParam: "search",
            additionalParams: searchParams,
          },
        },
        list: {
          class: EditorjsList,
          inlineToolbar: true,
          config: {
            defaultStyle: "unordered",
          },
        },
      },
      onChange: () => {
        save();
      },
    });

    return () => {
      editorRef.current?.destroy();
      editorRef.current = null;
    };
  }, []);

  const save = () => {
    editorRef.current?.save().then((outputData) => {
      if (hiddenInputRef.current) {
        hiddenInputRef.current.value = JSON.stringify(outputData);
      }
      onChange?.(outputData);
    });
  };

  return (
    <div className="text-editor-component">
      <div className="text-editor-component__wrapper mb-3">
        <div className="text-editor-component__label">{label}</div>
        <div className="text-editor-component__content mb-3">
          <div ref={holderRef} />
          <input
            type="hidden"
            name={fieldName}
            ref={hiddenInputRef}
            defaultValue={initialValue}
          />
        </div>
      </div>
    </div>
  );
};

export default TextEditor;
