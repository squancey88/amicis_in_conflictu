import React from "react";
import { render, screen } from "@testing-library/react";
import { Accordion } from ".";
import userEvent from "@testing-library/user-event";

describe("Accordion", () => {
  it("renders open", () => {
    render(
      <Accordion title="Test title" startOpen={true}>
        <p>Some content</p>
      </Accordion>,
    );

    expect(screen.getByRole("button")).toBeInTheDocument();
    expect(screen.getByText("Test title")).toBeInTheDocument();
    expect(screen.getByText("Some content").closest("body")).not.toHaveClass(
      "hidden",
    );
  });

  it("renders closed", () => {
    render(
      <Accordion title="Test title" startOpen={false}>
        <p>Some content</p>
      </Accordion>,
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
      <Accordion title="Test title" startOpen={true}>
        <p>Some content</p>
      </Accordion>,
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
