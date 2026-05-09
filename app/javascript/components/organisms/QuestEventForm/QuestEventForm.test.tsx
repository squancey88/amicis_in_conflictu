import React from "react";
import { render, screen } from "@testing-library/react";
import { QuestEventForm } from ".";

describe("QuestEventForm", () => {
  it("renders with no data", () => {
    render(<QuestEventForm data={[]} />);

    expect(screen.getByText("Event Details")).toBeInTheDocument();
    expect(screen.getByRole("button", { name: "Add" })).toBeInTheDocument();
  });
});
