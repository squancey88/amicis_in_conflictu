import { useState, useEffect } from "react";
import { GameSystem, type GroupedGameSystems } from "Types/common";
import { GroupedGameSystemsSelect } from "../../molecules";
import { Select } from "../../atoms/Select";

interface ScoringKeySelectorProps {
  modelName: string;
  selectedGameSystemId?: string;
  selectedScoringKey?: string;
  groupedGameSystems: Array<GroupedGameSystems>;
}

const ScoringKeySelector = ({
  modelName,
  groupedGameSystems,
  selectedGameSystemId,
  selectedScoringKey,
}: ScoringKeySelectorProps) => {
  const [selectedGameSystem, setSelectedGameSystem] = useState<
    GameSystem | undefined
  >();
  const [currentScoringKey, setCurrentScoringKey] = useState<
    string | undefined
  >(selectedScoringKey);

  const handleGameSystemChange = (
    event: React.ChangeEvent<HTMLSelectElement>,
  ) => {
    setGameSystemById(event.target.value);
    setCurrentScoringKey(undefined);
  };

  const setGameSystemById = (id: string) => {
    groupedGameSystems.forEach((group) => {
      const match = group.gameSystems.find((gameSystem) => gameSystem.id == id);
      if (match) {
        setSelectedGameSystem(match);

        return;
      }
    });
  };

  useEffect(() => {
    if (selectedGameSystemId) {
      setGameSystemById(selectedGameSystemId);
    }
  }, [selectedGameSystemId, groupedGameSystems]);

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
        {selectedGameSystem?.scoringKeys?.map((key) => {
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
