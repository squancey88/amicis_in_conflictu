import { useState, React } from "react";

interface PlayerCommonFields {
  name: string;
  id: string;
  type: string;
}

export interface PlayersSelectorProps {
  users: Array<PlayerCommonFields>;
  teams: Array<PlayerCommonFields>;
  fieldName: string;
}

const PlayersSelector = ({ users, teams, fieldName }: PlayersSelectorProps) => {
  const [selectedPlayers, setSelectedPlayers] = useState<PlayerCommonFields[]>(
    [],
  );
  const [currentSelection, setCurrentSelection] = useState<string>("");

  const handleAddPlayer = () => {
    if (currentSelection) {
      // Find the player object from the ID
      const player = [...users, ...teams].find(
        (p) => p.id === currentSelection,
      );

      if (player && !selectedPlayers.find((p) => p.id === player.id)) {
        setSelectedPlayers([...selectedPlayers, player]);
        setCurrentSelection(""); // Reset selection after adding
      }
    }
  };

  return (
    <div>
      <div className="input-group mb-3">
        <select
          className="form-select"
          value={currentSelection}
          onChange={(e) => setCurrentSelection(e.target.value)}
        >
          <option value="">Select a player...</option>
          <optgroup label="Users">
            {users.map((player) => (
              <option key={player.id} value={player.id}>
                {player.name}
              </option>
            ))}
          </optgroup>
          <optgroup label="Teams">
            {teams.map((player) => (
              <option key={player.id} value={player.id}>
                {player.name}
              </option>
            ))}
          </optgroup>
        </select>
        <button
          className="btn btn-outline-secondary"
          type="button"
          onClick={handleAddPlayer}
          disabled={!currentSelection}
        >
          <i className="bi bi-person-fill-add"></i>
        </button>
      </div>
      {selectedPlayers.length > 0 && (
        <div className="mt-3">
          <h6>Selected Players:</h6>
          <div className="d-flex flex-column gap-2">
            {selectedPlayers.map((player, index) => (
              <div
                key={player.id}
                className="d-flex flex-row justify-content-between"
              >
                {player.name}
                <input
                  type="hidden"
                  name={`${fieldName}[${index}][controller_type]`}
                  value={player.type}
                />
                <input
                  type="hidden"
                  name={`${fieldName}[${index}][controller_id]`}
                  value={player.id}
                />
                <button
                  className="btn btn-sm btn-danger ms-2"
                  onClick={() =>
                    setSelectedPlayers(
                      selectedPlayers.filter((p) => p.id !== player.id),
                    )
                  }
                >
                  Remove
                </button>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
};

export default PlayersSelector;
