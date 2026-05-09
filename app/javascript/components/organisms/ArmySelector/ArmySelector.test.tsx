import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import ArmySelector from ".";

describe("AmrySelector", () => {
  it("should render army list", () => {
    render(
      <ArmySelector
        selectedArmies={[]}
        allArmies={[]}
        showLists={[]}
      />
  });
});
