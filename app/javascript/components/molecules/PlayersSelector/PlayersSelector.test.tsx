import React from "react";
import { render, screen } from "@testing-library/react";
import { userEvent } from "@testing-library/user-event";
import "@testing-library/jest-dom";
import PlayersSelector from "./PlayersSelector";

describe("PlayersSelector", () => {
  const mockUsers = [
    { id: "1", name: "John Doe", type: "User" },
    { id: "2", name: "Jane Smith", type: "User" },
  ];

  const mockTeams = [{ id: "3", name: "Team A", type: "Team" }];

  it("renders the select dropdown", () => {
    render(
      <PlayersSelector
        users={mockUsers}
        teams={mockTeams}
        fieldName="players"
      />,
    );

    expect(screen.getByRole("combobox")).toBeInTheDocument();
  });

  it("adds a player when button is clicked", () => {
    const user = userEvent.setup();

    render(
      <PlayersSelector
        users={mockUsers}
        teams={mockTeams}
        fieldName="players"
      />,
    );

    const select = screen.getByRole("combobox");
    const addButton = screen.getByRole("button");

    user.selectOptions(select, "1");
    user.click(addButton);

    expect(screen.getByText("John Doe")).toBeInTheDocument();
  });
});
