import React, { useState } from "react";
import { ToggleSection } from "Atoms/ToggleSection";
import { TextInput } from "Atoms/TextInput";
import { Icon } from "Atoms/Icon";
import { TextEditor } from "Atoms/TextEditor";
import { QuestEventDataTextSection } from "Types/events";
import { useSortable } from "@dnd-kit/react/sortable";

interface QuestEventTextSectionFormProps {
  section: QuestEventDataTextSection;
  index: number;
  startOpen?: boolean;
}

const QuestEventTextSectionForm = ({
  id,
  section,
  index,
  startOpen,
}: QuestEventTextSectionFormProps) => {
  const [title, setTitle] = useState<string>(section.title);
  const fieldName = (attribute: string) => {
    return `quest_event[quest_event_datum_attributes][${index}][${attribute}]`;
  };

  const { ref, isDragging } = useSortable({ id, index });

  const updateTitle = (event: React.ChangeEvent<HTMLInputElement>) => {
    setTitle(event.target.value);
  };

  return (
    <div ref={ref} style={{ opacity: isDragging ? 0.5 : 1 }}>
      <ToggleSection
        icon={<Icon name="journal-text" />}
        title={title}
        startOpen={startOpen}
      >
        <input type="hidden" value={section.id} name={fieldName("id")} />
        <input type="hidden" value={section.type} name={fieldName("type")} />
        <input type="hidden" value={section.order} name={fieldName("order")} />
        <TextInput
          fieldName={fieldName("title")}
          label="Title"
          value={section.title}
          onChange={updateTitle}
        />
        <TextEditor
          fieldName={fieldName("content")}
          label="Details"
          initialValue={section.content}
        />
      </ToggleSection>
    </div>
  );
};

export default QuestEventTextSectionForm;
