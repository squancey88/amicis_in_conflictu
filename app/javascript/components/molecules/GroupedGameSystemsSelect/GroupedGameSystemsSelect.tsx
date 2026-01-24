import { React } from "react";
import { GroupedGameSystems } from "../../types/common";
import { Select, SelectProps } from "../../atoms/Select";

interface Props extends SelectProps {
  groupedGameSystems: Array<GroupedGameSystems>;
}

const GroupedGameSystemsSelect = ({
  groupedGameSystems,
  label,
  fieldName,
}: Props) => {
  return (
    <div>
      <Select label={label} fieldName={fieldName}>
        <option value="">Please Select</option>
        {groupedGameSystems.map((group, index) => (
          <optgroup key={index} label={group.groupName}>
            {group.gameSystems.map((gameSystem) => (
              <option value={gameSystem.id} key={gameSystem.id}>
                {gameSystem.name}
              </option>
            ))}
          </optgroup>
        ))}
      </Select>
    </div>
  );
};

export default GroupedGameSystemsSelect;
