import { useState } from "react";
import { GameSystem, type GroupedGameSystems } from "Types/common";
import { GroupedGameSystemsSelect } from "../../molecules";
import { Select } from "../../atoms/Select";

interface ScoringKeySelectorProps {
  modelName: string;
  selectedGameSystemId?: string;
  selectedScoringKey?: string;
  groupedGameSystems: Array<GroupedGameSystems>;
}

const findGameSystemById = (
  groupedGameSystems: Array<GroupedGameSystems>,
  id: string,
): GameSystem | undefined =>
  groupedGameSystems
    .flatMap((group) => group.gameSystems)
    .find((gameSystem) => gameSystem.id === id);

const ScoringKeySelector = ({
  modelName,
  groupedGameSystems,
  selectedGameSystemId,
  selectedScoringKey,
}: ScoringKeySelectorProps) => {
  const [manualGameSystemId, setManualGameSystemId] = useState<string | undefined>(undefined);
  const [currentScoringKey, setCurrentScoringKey] = useState<string | undefined>(
    selectedScoringKey,
  );

  const activeGameSystemId = manualGameSystemId ?? selectedGameSystemId;
  const selectedGameSystem = activeGameSystemId
    ? findGameSystemById(groupedGameSystems, activeGameSystemId)
    : undefined;

  const handleGameSystemChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setManualGameSystemId(event.target.value);
    setCurrentScoringKey(undefined);
  };

  return (
    <div>
      <GroupedGameSystemsSelect
        groupedGameSystems={groupedGameSystems}
        onChange={handleGameSystemChange}
        selectedValue={selectedGameSystem?.id}
        label="Game System"
        fieldName={`${modelName}[game_system_id]`}
        required={true}
      />
      <Select
        label="Scoring Key"
        fieldName={`${modelName}[scoring_key]`}
        disabled={!selectedGameSystem}
        selectedValue={currentScoringKey}
      >
        <option value="">--Please Select--</option>
        {selectedGameSystem?.scoringValues?.map((value) => {
          const key = value.key;
          return (
            <option key={key} value={key}>
              {key}
            </option>
          );
        })}
      </Select>
    </div>
  );
};

export default ScoringKeySelector;
