import { render, screen, within } from "@testing-library/react";
import { userEvent } from "@testing-library/user-event";
import "@testing-library/jest-dom";
import PlayersSelector from "./PlayersSelector";

describe("PlayersSelector", () => {
  const mockUsers = [
    {
      id: "1",
      name: "John Doe",
      type: "User",
      createdAt: "",
      updatedAt: "",
      displayName: "John",
    },
    {
      id: "2",
      name: "Jane Smith",
      type: "User",
      createdAt: "",
      updatedAt: "",
      displayName: "Jane",
    },
  ];

  const mockTeams = [
    {
      id: "3",
      name: "Team A",
      type: "Team",
      createdAt: "",
      updatedAt: "",
      displayName: "Team A",
    },
  ];

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

  it("adds a player when button is clicked", async () => {
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

    await user.selectOptions(select, "John Doe");
    await user.click(addButton);

    const playerRows = screen.getAllByTestId("player-row");
    expect(within(playerRows[0]).getByText("John Doe")).toBeInTheDocument();
  });
});
