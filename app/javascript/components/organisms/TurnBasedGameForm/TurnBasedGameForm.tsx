import { useState } from "react";
import { GameSystem, Player } from "Types/common";
import RawTurnDataGameForm from "./RawTurnData";
import ObjectiveTurnData from "./ObjectiveTurnData";

interface TurnBasedGameFormProps {
  players: Array<Required<Player>>;
  gameSystem: Required<GameSystem>;
  editable: boolean;
}

const TurnBasedGameForm = ({
  players,
  gameSystem,
  editable,
}: TurnBasedGameFormProps) => {
  const [playerData, setPlayerData] =
    useState<Array<Required<Player>>>(players);

  const hasTurnData =
    playerData[0].turns.length > 0 &&
    gameSystem.scoringValues[0].key in playerData[0].turns[0];

  const useObjectives = gameSystem.gameObjectives.length > 0 && !hasTurnData;

  return (
    <>
      {useObjectives ? (
        <ObjectiveTurnData
          players={players}
          gameSystem={gameSystem}
          editable={editable}
        />
      ) : (
        <RawTurnDataGameForm
          players={players}
          gameSystem={gameSystem}
          editable={editable}
        />
      )}
    </>
  );
};

export default TurnBasedGameForm;
