import { ChangeEvent, useState } from "react";
import { GameSystem, Player } from "Types/common";
import { Button } from "Atoms/Button";
import { TextInput } from "Atoms/TextInput";
import { TurnBasedGameTableHeader } from "../../molecules/TurnBasedGameTableHeader";

interface RawScoreTurnFormProps {
  players: Array<Required<Player>>;
  gameSystem: Required<GameSystem>;
  editable: boolean;
}

const RawScoreTurnForm = ({ players, gameSystem, editable }: RawScoreTurnFormProps) => {
  const [playerData, setPlayerData] = useState<Array<Required<Player>>>(players);

  const fieldName = (index: number) => {
    return `game[players_attributes][${index}]`;
  };

  const playerScoreByKey = (playerIndex: number, key: string) => {
    return playerData[playerIndex].turns.reduce((acc, turn) => {
      return acc + Number(turn[key] ?? 0);
    }, 0);
  };

  const playerTotal = (playerIndex: number): number => {
    return playerData[playerIndex].turns.reduce((acc, turn) => {
      return acc + Object.values(turn).reduce((t, v) => t + Number(v ?? 0), 0);
    }, 0);
  };

  const handleAddTurn = () => {
    setPlayerData((prev) =>
      prev.map((player) => ({
        ...player,
        turns: [...player.turns, {}],
      })),
    );
  };

  const handleScoreChange = (
    event: ChangeEvent<HTMLInputElement>,
    playerIndex: number,
    turnIndex: number,
    scoreKey: string,
  ) => {
    setPlayerData((prev) => {
      return prev.map((player, index) => {
        if (index !== playerIndex) return player;
        return {
          ...player,
          turns: player.turns.map((turn, ti) => {
            if (ti !== turnIndex) return turn;
            return { ...turn, [scoreKey]: Number(event.target.value) };
          }),
        };
      });
    });
  };

  const totalRow = (
    <tr>
      <td>Total</td>
      {playerData.map((_, playerIndex) => {
        return (
          <td key={`${playerIndex}-total`} className="turn-grid__cell-total" data-testid={`total-score-${playerIndex}`}>
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
                    data-testid={`${score.key}-summary-${playerIndex}`}
                  >
                    {playerScoreByKey(playerIndex, score.key)}
                  </div>
                );
              })}
            </div>
          </td>
        );
      })}
    </tr>
  );

  const turnNumberInput = (turnIndex: number, playerIndex: number, player: Required<Player>) => {
    return (
      <div className="turn-grid__cell-inputs-wrapper">
        {gameSystem.scoringValues.map((score) => {
          let currentScore;
          if (player.turns[turnIndex][score.key]) {
            currentScore = player.turns[turnIndex][score.key].toString();
          } else {
            currentScore = "";
          }
          return (
            <TextInput
              key={`${playerIndex}-${turnIndex}-${score.key}`}
              fieldName={`${fieldName(playerIndex)}[turns][][${score.key}]`}
              label={score.name}
              disabled={!editable}
              onChange={(e) => handleScoreChange(e, playerIndex, turnIndex, score.key)}
              value={currentScore}
              testId={`input-${score.key}-turn-${turnIndex + 1}-player-${playerIndex}`}
            />
          );
        })}
      </div>
    );
  };

  const turnRow = (turnIndex: number) => {
    return (
      <tr className="turn-grid__row" key={`${turnIndex}-row`}>
        <th scope="row" className="turn-grid__cell-counter">
          {turnIndex + 1}
        </th>
        {playerData.map((player, playerIndex) => {
          return (
            <td className="turn-grid__cell-inputs" key={`${playerIndex}-${turnIndex}-cell`}>
              {turnNumberInput(turnIndex, playerIndex, player)}
            </td>
          );
        })}
      </tr>
    );
  };

  const turnRows = <tbody>{playerData[0].turns.map((_, turnIndex) => turnRow(turnIndex))}</tbody>;

  return (
    <div className="game-form-turn-based">
      <Button label="Add Turn" icon="plus-square" variant="primary" onClick={handleAddTurn} />

      <div className="table-responsive">
        <table className="turn-grid table">
          <TurnBasedGameTableHeader playerData={playerData} />
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

export default RawScoreTurnForm;
