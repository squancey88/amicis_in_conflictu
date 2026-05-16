import React from "react";
import { render } from "@testing-library/react";
import { GameMapViewer } from ".";

describe("GameMapViewer", () => {
  it("renders", () => {
    const { container } = render(
      <GameMapViewer mapType="hex_diamond" config={{ min: 1, max: 4 }} />,
    );
    expect(container.querySelector(".game-map")).toBeInTheDocument();
    expect(container.querySelector(".hexagon-diamond")).toBeInTheDocument();
    expect(container.querySelectorAll(".hexagon").length).toBe(16);
  });
});
