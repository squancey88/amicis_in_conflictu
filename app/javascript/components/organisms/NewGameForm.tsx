import { useState, useMemo } from "react";
import { GroupedGameSystems, Player } from "../types/common";
import {
  CampaignSelect,
  GroupedGameSystemsSelect,
  PlayersSelector,
} from "../molecules";
import { PlayersSelectorProps } from "../molecules/PlayersSelector";
import { CampaignSelectProps } from "../molecules/CampaignSelect";

interface NewGameFormProps extends CampaignSelectProps {
  groupedGameSystems: Array<GroupedGameSystems>;
  playersSelector: PlayersSelectorProps;
}

const NewGameForm = ({
  groupedGameSystems,
  playersSelector,
  campaignsByGameSystem,
}: NewGameFormProps) => {
  const [gameSystemId, setGameSystemId] = useState<string | undefined>(
    undefined,
  );
  const [selectedPlayers, setSelectedPlayers] = useState<Array<Player>>([]);

  const handleGameSystemChange = (
    event: React.ChangeEvent<HTMLSelectElement>,
  ) => {
    setGameSystemId(event.target.value);
  };

  const canSubmit = gameSystemId !== undefined && selectedPlayers.length > 1;
  console.log({
    gameSystemId,
    playersLength: selectedPlayers.length,
    canSubmit,
  });

  // TODO add in campaign support for auto selection of players

  return (
    <>
      <div className="modal-body">
        <GroupedGameSystemsSelect
          groupedGameSystems={groupedGameSystems}
          onChange={handleGameSystemChange}
          label="Game System"
          fieldName="game[game_system_id]"
        />

        <CampaignSelect
          campaignsByGameSystem={campaignsByGameSystem}
          selectedId={gameSystemId}
          label="Campaign"
          fieldName="game[campaign_id]"
        />

        <PlayersSelector
          {...playersSelector}
          onChange={setSelectedPlayers}
        ></PlayersSelector>
      </div>
      <div className="modal-footer">
        <button
          type="button"
          className="btn btn-secondary"
          data-bs-dismiss="modal"
        >
          Close
        </button>

        <button type="submit" className="btn btn-primary" disabled={!canSubmit}>
          Create Game
        </button>
      </div>
    </>
  );
};

export default NewGameForm;
