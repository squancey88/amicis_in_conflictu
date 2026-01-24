import { React } from "react";
import { GroupedGameSystems } from "../types/common";
import { GroupedGameSystemsSelect, PlayersSelector } from "../molecules";
import { PlayersSelectorProps } from "../molecules/PlayersSelector";

interface NewGameFormProps {
  groupedGameSystems: Array<GroupedGameSystems>;
  playersSelector: PlayersSelectorProps;
}

const NewGameForm = ({
  groupedGameSystems,
  playersSelector,
}: NewGameFormProps) => {
  return (
    <div>
      <GroupedGameSystemsSelect
        groupedGameSystems={groupedGameSystems}
        label="Game System"
        fieldName="game[game_system_id]"
      />

      <PlayersSelector {...playersSelector}></PlayersSelector>
    </div>
  );
};

export default NewGameForm;
