import React, { useState } from "react";
import { Army, ArmyList, Player, PlayerArmy } from "Types/common";
import { Select } from "Atoms/Select";

export interface ArmySelectorProps {
  fieldName: string;
  selectedArmies: Array<PlayerArmy>;
  player: Player;
  allArmies: Array<Army>;
  showLists: boolean;
}

const ArmySelector = ({
  fieldName,
  player,
  selectedArmies,
  showLists = true,
}: ArmySelectorProps) => {
  const [currentArmies, setCurrentArmies] = useState(selectedArmies);
  const [addingArmy, setAddingArmy] = useState<Army | undefined>(undefined);

  const handleAddArmy = () => {};
  const handleArmyChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setAddingArmy(
      player.armies.find((army: Army) => event.target.value === army.id),
    );
  };

  return (
    <div className="army-selector">
      <div className="mb-3">
        {currentArmies.map((playerArmy) => (
          <div key={playerArmy.id}>
            <div>{playerArmy.army.name}</div>
            <div>{playerArmy.armyList.name}</div>
          </div>
        ))}
      </div>
      <div className="">
        <Select fieldName="add_army" onChange={handleArmyChange}>
          {player.armies.map((army: Army) => (
            <option key={army.id} value={army.id}>
              {army.name}
            </option>
          ))}
        </Select>
        {showLists && addingArmy && (
          <Select fieldName="add_list">
            {addingArmy.lists.map((list: ArmyList) => (
              <option key={list.id} value={list.id}>
                {list.name}
              </option>
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
