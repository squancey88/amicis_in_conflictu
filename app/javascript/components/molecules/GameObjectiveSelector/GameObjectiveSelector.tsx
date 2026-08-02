import { useState, useEffect, ChangeEvent } from "react";
import { GameObjective, GameSystem } from "Types/common";
import { Button } from "Atoms/Button";
import { Select } from "Atoms/Select";

interface GameObjectiveSelectorProps {
  gameSystem: Required<GameSystem>;
  alreadyUsed?: Array<GameObjective>;
  onSelect: (gameObjective: GameObjective) => void;
}

const GameObjectiveSelector = ({
  gameSystem,
  alreadyUsed = [],
  onSelect,
}: GameObjectiveSelectorProps) => {
  const [selected, setSelected] = useState<string | undefined>(undefined);
  const [groupedObjectives, setGroupObjectives] = useState<
    Array<{
      groupName: string;
      objectives: Array<{ objective: GameObjective; disabled: boolean }>;
    }>
  >([]);

  useEffect(() => {
    setGroupObjectives(
      gameSystem.scoringValues.map((score) => {
        return {
          groupName: score.name,
          objectives: gameSystem.gameObjectives
            .filter((objective) => objective.scoringKey === score.key)
            .map((objective) => {
              return {
                objective: objective,
                disabled: alreadyUsed.some((used) => used.id === objective.id),
              };
            }),
        };
      }),
    );
  }, [gameSystem, alreadyUsed]);

  const handleClick = () => {
    const match = gameSystem.gameObjectives.find(
      (objective) => objective.id === selected,
    );
    if (match) {
      onSelect(match);
      setSelected(undefined);
    }
  };

  const handleChange = (event: ChangeEvent<HTMLSelectElement>) => {
    setSelected(event.target.value);
  };

  return (
    <div>
      <Select fieldName="" onChange={handleChange}>
        <option value="">Please Select</option>
        {groupedObjectives.map((objectiveGroup) => (
          <optgroup
            key={objectiveGroup.groupName}
            label={objectiveGroup.groupName}
          >
            {objectiveGroup.objectives.map((value) => {
              return (
                <option
                  value={value.objective.id}
                  key={value.objective.id}
                  disabled={value.disabled}
                >
                  {value.objective.name}
                </option>
              );
            })}
          </optgroup>
        ))}
      </Select>
      <Button variant="primary" label="Select" onClick={handleClick}></Button>
    </div>
  );
};

export default GameObjectiveSelector;
