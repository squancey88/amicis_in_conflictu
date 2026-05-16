import React from "react";
import { MapTypes } from "Types/common";

interface HexDiamondConfig {
  min: number;
  max: number;
}

interface GameMapViewerProps {
  mapType: MapTypes;
  config: HexDiamondConfig;
}

const HexDiamondViewer = ({ config }: { config: HexDiamondConfig }) => {
  const minHex = Number(config.min);
  const maxHex = Number(config.max);
  const diff = config.max - config.min;
  const height = diff * 2 + 1;

  const hexPerRow = (row: number) => {
    const totalRows = (maxHex - minHex) * 2 + 1;
    const mid = Math.floor(totalRows / 2);
    return maxHex - Math.abs(row - mid);
  };

  const handleHexPick = (rowIndex: number, colIndex: number) => {};

  return (
    <div className="hexagon-diamond">
      {[...Array(height)].map((_x, rowIndex) => {
        return (
          <div className="row" key={rowIndex}>
            {[...Array(hexPerRow(rowIndex))].map((_x, colIndex) => {
              return (
                <div
                  className="hexagon"
                  key={colIndex}
                  onClick={() => handleHexPick(rowIndex, colIndex)}
                ></div>
              );
            })}
          </div>
        );
      })}
    </div>
  );
};

const GameMapViewer = ({ mapType, config }: GameMapViewerProps) => {
  return (
    <div>
      <div className="game_map">
        {mapType == "hex_diamond" && <HexDiamondViewer config={config} />}
      </div>
      <div></div>
    </div>
  );
};

export default GameMapViewer;
