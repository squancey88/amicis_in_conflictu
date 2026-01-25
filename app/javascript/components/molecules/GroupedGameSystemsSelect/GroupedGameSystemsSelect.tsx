import { GroupedGameSystems } from "Types/common";
import { Select, SelectProps } from "Atoms/Select";

interface Props extends SelectProps {
  groupedGameSystems: Array<GroupedGameSystems>;
}

const GroupedGameSystemsSelect = ({ groupedGameSystems, ...props }: Props) => {
  return (
    <div>
      <Select {...props}>
        <option value="">Please Select</option>
        {groupedGameSystems.map((group) => (
          <optgroup key={group.groupName} label={group.groupName}>
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
