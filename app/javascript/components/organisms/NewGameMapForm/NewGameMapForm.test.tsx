import React from "react";
import { render, screen } from "@testing-library/react";
import { NewGameMapForm } from ".";
import userEvent from "@testing-library/user-event";

describe("NewGameMapForm", () => {
  it("renders", () => {
    render(<NewGameMapForm types={["hex_diamond"]} />);

    expect(screen.getByLabelText("Name")).toBeInTheDocument();
    expect(screen.getByLabelText("Type")).toBeInTheDocument();
  });

  it("selecting hex diamond loads form", async () => {
    render(<NewGameMapForm types={["hex_diamond", "hex_grid"]} />);

    await userEvent.selectOptions(screen.getByLabelText("Type"), "hex_diamond");

    expect(screen.getByLabelText("Min")).toBeInTheDocument();
    expect(screen.getByLabelText("Max")).toBeInTheDocument();
  });

  it("selecting hex grid loads form", async () => {
    render(<NewGameMapForm types={["hex_diamond", "hex_grid"]} />);

    await userEvent.selectOptions(screen.getByLabelText("Type"), "hex_grid");

    expect(screen.getByLabelText("Width")).toBeInTheDocument();
    expect(screen.getByLabelText("Height")).toBeInTheDocument();
  });
});
