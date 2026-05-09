import { Button } from "Atoms/Button";
import React, { useState } from "react";
import { QuestEventTextSectionForm } from "Molecules/QuestEventTextSectionForm";
import { QuestEventData, QuestEventDataTextSection } from "Types/events";

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
    setSections((prev) => [
      ...prev,
      {
        data: {},
        new: true,
        key: `new-${newCount}`,
      } as SectionWrapper,
    ]);
    newCount++;
  };

  const renderSections = sections.map((section, index) => {
    return (
      <QuestEventTextSectionForm
        key={section.key}
        section={section.data as QuestEventDataTextSection}
        index={index}
        startOpen={true}
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

      <div>{renderSections}</div>
    </div>
  );
};

export default QuestEventForm;
