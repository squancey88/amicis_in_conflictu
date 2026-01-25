import React, { useState } from "react";
import { Army, PlayerArmy } from "Types/common";
import { Select } from "Atoms/Select";

export interface ArmySelectorProps {
  fieldName: string;
  selectedArmies: Array<PlayerArmy>;
  allArmies: Array<Army>;
  showLists: boolean;
}

const ArmySelector = ({
  fieldName,
  selectedArmies,
  allArmies,
  showLists,
}: ArmySelectorProps) => {
  const [currentArmies, setCurrentArmies] = useState(selectedArmies);
  const [addingArmy, setAddingArmy] = useState<Army | undefined>(undefined);

  const handleAddArmy = () => {};
  const handleArmyChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setAddingArmy(allArmies.find((army) => event.target.value === army.id));
  };

  return (
    <div>
      <div className="">
        {currentArmies.map((playerArmy) => (
          <div>
            <div>{playerArmy.army.name}</div>
            <div>{playerArmy.armyList.name}</div>
          </div>
        ))}
      </div>
      <div className="">
        <Select fieldName="add_army" onChange={handleArmyChange}>
          {allArmies.map((army) => (
            <option value={army.id}>{army.name}</option>
          ))}
        </Select>
        {showLists && addingArmy !== undefined && (
          <Select fieldName="add_list">
            {addingArmy.lists.map((list) => (
              <option value={list.id}>{list.name}</option>
            ))}
          </Select>
        )}
        <button className="btn btn-secondary" onClick={handleAddArmy}>
          Add Army
        </button>
      </div>
    </div>
  );
};
