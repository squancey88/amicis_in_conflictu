import { Button } from "Atoms/Button";
import { useState } from "react";
import { QuestEventTextSectionForm } from "Molecules/QuestEventTextSectionForm";
import { QuestEventData } from "Types/events";

interface QuestEventFormProps {
  data: Array<QuestEventData>;
}

const QuestEventForm = ({ data }: QuestEventFormProps) => {
  const [sections, setSections] = useState<Array<QuestEventData>>(data);
  const handleAddClick = () => {
    setSections((prev) => [...prev, {} as QuestEventData]);
  };

  const renderSections = sections.map((section) => {
    return (
      <QuestEventTextSectionForm
        section={section}
        startOpen={true}
      ></QuestEventTextSectionForm>
    );
  });

  return (
    <div>
      <div>
        <h3>Event Details</h3>
      </div>
      <div>
        <Button label="Add" onClick={handleAddClick} variant="secondary" />
      </div>

      <div>{renderSections}</div>
    </div>
  );
};

export default QuestEventForm;
