import React from "react";
import { Accordion } from "Atoms/Accordion";
import { TextInput } from "Atoms/TextInput";
import { TextEditor } from "Atoms/TextEditor";
import { QuestEventTextSection } from "Types/events";

interface QuestEventTextSectionFormProps {
  section: QuestEventTextSection;
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
      <TextInput
        fieldName={fieldName("title")}
        label="Title"
        value={section.title}
      />
      <TextEditor
        fieldName={fieldName("content")}
        label="Details"
        initialValue={section.details}
      />
    </Accordion>
  );
};

export default QuestEventTextSectionForm;
