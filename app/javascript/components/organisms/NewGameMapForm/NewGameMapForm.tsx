import React, { useState } from "react";
import { Select } from "Atoms/Select";
import { TextInput } from "Atoms/TextInput";
import { Button } from "Atoms/Button";
import { MapTypes } from "Types/common";

interface NewGameMapFormProps {
  types: Array<string>;
}

const HexDiamondForm = () => {
  return (
    <div>
      <TextInput label="Min" fieldName="game_map[config][min]" value="" />
      <TextInput label="Max" fieldName="game_map[config][max]" value="" />
    </div>
  );
};

const HexGridForm = () => {
  return (
    <div>
      <TextInput label="Width" fieldName="game_map[config][width]" value="" />
      <TextInput label="Height" fieldName="game_map[config][height]" value="" />
    </div>
  );
};

const NewGameMapForm = ({ types }: NewGameMapFormProps) => {
  const [type, setType] = useState<MapTypes | undefined>(undefined);

  const handleTypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setType(event.target.value as MapTypes);
  };

  return (
    <div>
      <TextInput label="Name" fieldName="game_map[name]" value="" />
      <Select
        label="Type"
        fieldName="game_map[map_type]"
        onChange={(e) => handleTypeChange(e)}
      >
        <option value={undefined}>--</option>
        {types.map((item) => (
          <option value={item}>{item}</option>
        ))}
      </Select>

      {type && (
        <div>
          <h3>Options</h3>
          {type == "hex_grid" && <HexGridForm />}
          {type == "hex_diamond" && <HexDiamondForm />}
        </div>
      )}

      <Button type="submit" variant="primary" label="Create" />
    </div>
  );
};

export default NewGameMapForm;
