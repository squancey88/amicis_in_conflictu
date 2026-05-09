import React from "react";
import { render, screen } from "@testing-library/react";
import { ToggleSection } from ".";
import userEvent from "@testing-library/user-event";

describe("ToggleSection", () => {
  it("renders open", () => {
    render(
      <ToggleSection title="Test title" startOpen={true}>
        <p>Some content</p>
      </ToggleSection>,
    );

    expect(screen.getByRole("button")).toBeInTheDocument();
    expect(screen.getByText("Test title")).toBeInTheDocument();
    expect(screen.getByText("Some content").closest("body")).not.toHaveClass(
      "hidden",
    );
  });

  it("renders closed", () => {
    render(
      <ToggleSection title="Test title" startOpen={false}>
        <p>Some content</p>
      </ToggleSection>,
    );

    expect(screen.getByRole("button")).toBeInTheDocument();
    expect(screen.getByText("Test title")).toBeInTheDocument();
    expect(screen.getByText("Some content").closest(".body")).toHaveClass(
      "hidden",
    );
  });

  it("toggles correctly", async () => {
    const user = userEvent.setup();

    render(
      <ToggleSection title="Test title" startOpen={true}>
        <p>Some content</p>
      </ToggleSection>,
    );

    expect(screen.getByText("Some content").closest("body")).not.toHaveClass(
      "hidden",
    );

    await user.click(screen.getByRole("button"));

    expect(screen.getByText("Some content").closest(".body")).toHaveClass(
      "hidden",
    );
  });
});
