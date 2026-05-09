import { Button } from "Atoms/Button";
import React, { useState } from "react";
import { QuestEventTextSectionForm } from "Molecules/QuestEventTextSectionForm";
import { QuestEventData, QuestEventDataTextSection } from "Types/events";
import { DragDropProvider, type DragEndEvent } from "@dnd-kit/react";
import { move } from "@dnd-kit/helpers";

interface SectionWrapper {
  data: QuestEventData;
  new: boolean;
  key: string;
}

interface QuestEventFormProps {
  data: Array<QuestEventData>;
}

const QuestEventForm = ({ data }: QuestEventFormProps) => {
  const [sections, setSections] = useState<Array<SectionWrapper>>(
    data.map((section) => {
      return {
        data: section,
        new: false,
        key: section.id,
      };
    }),
  );

  let newCount = 0;

  const handleAddClick = () => {
    const key = `new-${newCount}`;
    setSections((prev) => [
      ...prev,
      {
        data: {
          type: "QuestEventData::TextSection",
          order: sections.length,
        } as QuestEventData,
        new: true,
        key: key,
      } as SectionWrapper,
    ]);
    newCount++;
  };

  const handleDragEnd = (event: DragEndEvent) => {
    if (event.canceled) return;

    setSections((prev) =>
      move(prev, event).map((section: SectionWrapper, i: number) => ({
        ...section,
        data: { ...section.data, order: i },
      })),
    );
  };

  const renderSections = sections.map((section, index) => {
    return (
      <QuestEventTextSectionForm
        id={section.key}
        key={section.key}
        section={section.data as QuestEventDataTextSection}
        index={index}
        startOpen={false}
      />
    );
  });

  return (
    <div>
      <div className="aic-title-with-buttons">
        <div className="content">
          <h3>Event Details</h3>
        </div>
        <div className="buttons">
          <Button label="Add" onClick={handleAddClick} variant="secondary" />
        </div>
      </div>

      <DragDropProvider onDragEnd={handleDragEnd}>
        {renderSections}
      </DragDropProvider>
    </div>
  );
};

export default QuestEventForm;
