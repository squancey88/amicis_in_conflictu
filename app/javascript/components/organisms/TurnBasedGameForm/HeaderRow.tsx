import { Player } from "Types/common";

interface HeaderRowProps {
  playerData: Array<Required<Player>>;
}

const HeaderRow = ({ playerData }: HeaderRowProps) => {
  return (
    <thead>
      <tr className="turn-grid__row">
        <th scope="col" className="turn-grid__cell-counter">
          Turn
        </th>
        {playerData.map((player, playerIndex) => {
          return (
            <th key={player.id} scope="col" className="turn-grid__cell-player">
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
  );
};

export default HeaderRow;
