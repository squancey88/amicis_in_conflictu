import React from "react";
import { GameObjective } from "Types/common";
import { Select, SelectProps } from "Atoms/Select";

interface GameObjectiveSelectProps extends SelectProps {
  gameObjectives: Array<GameObjective>;
}

const GameObjectiveSelect = ({
  gameObjectives,
  ...props
}: GameObjectiveSelectProps) => {
  return (
    <Select {...props}>
      <option value="">Please Select</option>
      {gameObjectives.map((objective) => (
        <option value={objective.id} key={objective.id}>
          {objective.name}
        </option>
      ))}
    </Select>
  );
};

export default GameObjectiveSelect;
