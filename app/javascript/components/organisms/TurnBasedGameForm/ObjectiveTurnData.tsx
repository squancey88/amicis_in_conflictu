import { useState } from "react";
import { GameSystem, Player, TurnObjective, GameObjective } from "Types/common";
import { Button } from "Atoms/Button";
import { TextInput } from "Atoms/TextInput";
import { GameObjectiveSelector } from "Molecules/GameObjectiveSelector";

interface ObjectiveTurnDataProps {
  players: Array<Required<Player>>;
  gameSystem: Required<GameSystem>;
  editable: boolean;
}

const ObjectiveTurnData = ({
  players,
  gameSystem,
  editable,
}: ObjectiveTurnDataProps) => {
  const [playerData, setPlayerData] =
    useState<Array<Required<Player>>>(players);

  const maxTurnFromPlayer = (): number => {
    return Math.max(
      ...players.map((player) => {
        const turns = player.turnObjectives.map((to) => to.turn);
        return turns.length > 0 ? Math.max(...turns) : 0;
      }),
    );
  };

  const [turnCount, setTurnCount] = useState<number>(maxTurnFromPlayer());

  const fieldName = (index: number, recordIndex: number) => {
    return `game[players_attributes][${index}][turn_objectives_attributes][${recordIndex}]`;
  };

  const playerScoreByKey = (playerIndex: number, key: string) => {
    return playerData[playerIndex].turnObjectives
      .filter((o) => o.gameObjective.scoringKey === key)
      .reduce((t, o) => t + Number(o.pointsScored), 0);
  };

  const playerTotal = (playerIndex: number): number => {
    return playerData[playerIndex].turnObjectives.reduce(
      (t, o) => t + Number(o.pointsScored),
      0,
    );
  };

  const handleAddTurn = () => {
    setTurnCount((prev) => prev + 1);
  };

  const totalRow = (
    <tr>
      <td>Total</td>
      {playerData.map((_, playerIndex) => {
        return (
          <td key={`${playerIndex}-total`} className="turn-grid__cell-total">
            {playerTotal(playerIndex)}
          </td>
        );
      })}
    </tr>
  );

  const byScoreRow = (
    <tr>
      <td>By Score</td>
      {playerData.map((_, playerIndex) => {
        return (
          <td className="turn-grid__cell-total" key={`${playerIndex}-by-score`}>
            <div className="turn-grid__cell-total-wrapper">
              {gameSystem.scoringValues.map((score) => {
                return (
                  <div
                    className="score-container"
                    key={`${playerIndex}-${score.key}-summary`}
                  >
                    {score.name}: {playerScoreByKey(playerIndex, score.key)}
                  </div>
                );
              })}
            </div>
          </td>
        );
      })}
    </tr>
  );

  const handleAddObjective = (
    playerIndex: number,
    turn: number,
    objective: GameObjective,
  ) => {
    setPlayerData((prev) => {
      return prev.map((player, index) => {
        if (index !== playerIndex) return player;
        return {
          ...player,
          turnObjectives: [
            ...player.turnObjectives,
            {
              gameObjective: objective,
              pointsScored: 0,
              turn: turn,
            } as TurnObjective,
          ],
        };
      });
    });
  };

  const handleChange = (
    playerIndex: number,
    turn: number,
    objective: GameObjective,
    newScore: number,
  ) => {
    setPlayerData((prev) => {
      return prev.map((player, index) => {
        if (index !== playerIndex) return player;
        return {
          ...player,
          turnObjectives: player.turnObjectives.map((o) => {
            if (o.turn !== turn || o.gameObjective.id !== objective.id)
              return o;
            return {
              ...o,
              pointsScored: newScore,
            };
          }),
        };
      });
    });
  };

  const objectiveRow = (
    turnObjective: TurnObjective,
    playerIndex: number,
    recordIndex: number,
  ) => {
    return (
      <div
        key={
          turnObjective.id ??
          `${playerIndex}-${turnObjective.turn}-${turnObjective.gameObjective.id}`
        }
      >
        <div>{turnObjective.gameObjective.name}</div>
        {turnObjective.id && (
          <input
            type="hidden"
            name={`${fieldName(playerIndex, recordIndex)}[id]`}
            value={turnObjective.id}
          />
        )}
        <input
          type="hidden"
          name={`${fieldName(playerIndex, recordIndex)}[game_objective_id]`}
          value={turnObjective.gameObjective.id}
        />
        <input
          type="hidden"
          name={`${fieldName(playerIndex, recordIndex)}[turn]`}
          value={turnObjective.turn}
        />
        <TextInput
          fieldName={`${fieldName(playerIndex, recordIndex)}[points_scored]`}
          label="Scored"
          disabled={editable}
          onChange={(e) =>
            handleChange(
              playerIndex,
              turnObjective.turn,
              turnObjective.gameObjective,
              Number(e.target.value),
            )
          }
          value={`${turnObjective.pointsScored ?? ""}`}
        />
      </div>
    );
  };

  const turnRow = (turnIndex: number) => {
    const turn = turnIndex + 1;
    return (
      <tr className="turn-grid__row" key={`${turnIndex}-row`}>
        <th scope="row" className="turn-grid__cell-counter">
          {turnIndex + 1}
        </th>
        {playerData.map((player, playerIndex) => {
          return (
            <td
              className="turn-grid__cell-inputs"
              key={`${playerIndex}-${turnIndex}-cell`}
            >
              <>
                {player.turnObjectives
                  .map((objective, index) => ({ objective, index }))
                  .filter(({ objective }) => objective.turn === turn)
                  .map(({ objective, index }) =>
                    objectiveRow(objective, playerIndex, index),
                  )}
                <GameObjectiveSelector
                  gameSystem={gameSystem}
                  alreadyUsed={player.turnObjectives
                    .filter((o) => o.turn === turn)
                    .map((o) => o.gameObjective)}
                  onSelect={(e) => handleAddObjective(playerIndex, turn, e)}
                />
              </>
            </td>
          );
        })}
      </tr>
    );
  };

  const turnRows = (
    <tbody>
      {Array.from({ length: turnCount }).map((_, turnIndex) =>
        turnRow(turnIndex),
      )}
    </tbody>
  );

  return (
    <div className="game-form-turn-based">
      <Button
        label="Add Turn"
        icon="plus-square"
        variant="primary"
        onClick={handleAddTurn}
      />

      <div className="table-responsive">
        <table className="turn-grid table">
          <thead>
            <tr className="turn-grid__row">
              <th scope="col" className="turn-grid__cell-counter">
                Turn
              </th>
              {playerData.map((player, playerIndex) => {
                return (
                  <th
                    key={player.id}
                    scope="col"
                    className="turn-grid__cell-player"
                  >
                    {player.displayName}
                    <input
                      type="hidden"
                      name={`game[players_attributes][${playerIndex}][id]`}
                      value={player.id}
                    />
                  </th>
                );
              })}
            </tr>
          </thead>
          {turnRows}
          <tfoot className="table-group-divider">
            {byScoreRow}
            {totalRow}
          </tfoot>
        </table>
      </div>
    </div>
  );
};

export default ObjectiveTurnData;
