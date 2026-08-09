import { useState, ChangeEvent } from "react";
import { GameObjective, GameSystem } from "Types/common";
import { Button } from "Atoms/Button";
import { Select, type SelectProps } from "Atoms/Select";

interface GameObjectiveSelectorProps extends SelectProps {
  gameSystem: Required<GameSystem>;
  alreadyUsed?: Array<GameObjective>;
  onSelect: (gameObjective: GameObjective) => void;
}

const buildGroupedObjectives = (gameSystem: Required<GameSystem>, alreadyUsed: Array<GameObjective>) =>
  gameSystem.scoringValues.map((score) => ({
    groupName: score.name,
    objectives: gameSystem.gameObjectives
      .filter((objective) => objective.scoringKey === score.key)
      .map((objective) => ({
        objective,
        disabled: alreadyUsed.some((used) => used.id === objective.id),
      })),
  }));

const GameObjectiveSelector = ({ gameSystem, alreadyUsed = [], onSelect, ...props }: GameObjectiveSelectorProps) => {
  const [selected, setSelected] = useState<string | undefined>(undefined);

  const groupedObjectives = buildGroupedObjectives(gameSystem, alreadyUsed);

  const handleClick = () => {
    const match = gameSystem.gameObjectives.find((objective) => objective.id === selected);
    if (match) {
      onSelect(match);
      setSelected(undefined);
    }
  };

  const handleChange = (event: ChangeEvent<HTMLSelectElement>) => {
    setSelected(event.target.value);
  };

  const { testId, ...selectProps } = props;

  return (
    <div data-testid={testId}>
      <Select {...selectProps} onChange={handleChange}>
        <option value="">Please Select</option>
        {groupedObjectives.map((objectiveGroup) => (
          <optgroup key={objectiveGroup.groupName} label={objectiveGroup.groupName}>
            {objectiveGroup.objectives.map((value) => {
              return (
                <option value={value.objective.id} key={value.objective.id} disabled={value.disabled}>
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
