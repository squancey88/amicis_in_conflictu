import React from "react";
import { Accordion } from "Atoms/Accordion";
import { TextInput } from "Atoms/TextInput";
import { TextEditor } from "Atoms/TextEditor";
import { QuestEventDataTextSection } from "Types/events";

interface QuestEventTextSectionFormProps {
  section: QuestEventDataTextSection;
  index?: number;
  startOpen?: boolean;
}

const QuestEventTextSectionForm = ({
  section,
  index,
  startOpen,
}: QuestEventTextSectionFormProps) => {
  const fieldName = (attribute: string) => {
    return `quest_event[quest_event_datum_attributes][${index}][${attribute}]`;
  };

  return (
    <Accordion title="Text Section" startOpen={startOpen}>
      <input type="hidden" value={section.id} name={fieldName("id")} />
      <input type="hidden" value={section.type} name={fieldName("type")} />
      <TextInput
        fieldName={fieldName("title")}
        label="Title"
        value={section.title}
      />
      <TextEditor
        fieldName={fieldName("content")}
        label="Details"
        initialValue={section.content}
      />
    </Accordion>
  );
};

export default QuestEventTextSectionForm;
