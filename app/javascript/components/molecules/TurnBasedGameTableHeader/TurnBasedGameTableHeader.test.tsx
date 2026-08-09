import { render, screen } from "@testing-library/react";
import { TurnBasedGameTableHeader } from ".";

describe("TurnBasedGameTableHeader", () => {
  const players = [
    {
      id: "1",
      displayName: "Player 1",
      type: "User",
      turns: [],
      turnObjectives: [],
      createdAt: "",
      updatedAt: "",
    },
    {
      id: "2",
      displayName: "Player 2",
      type: "User",
      turns: [],
      turnObjectives: [],
      createdAt: "",
      updatedAt: "",
    },
  ];

  it("renders", () => {
    const { container } = render(
      <table>
        <TurnBasedGameTableHeader playerData={players} />
      </table>,
    );

    expect(screen.getByRole("columnheader", { name: "Player 1" })).toBeInTheDocument();
    expect(screen.getByRole("columnheader", { name: "Player 2" })).toBeInTheDocument();

    expect(container.querySelector("[name='game[players_attributes][0][id]']")).toHaveValue("1");
    expect(container.querySelector("[name='game[players_attributes][1][id]']")).toHaveValue("2");
  });
});
