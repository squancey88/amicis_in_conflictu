import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
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
    expect(
      screen.getByText("Some content").closest(".aic-toggle-section"),
    ).not.toHaveClass("closed");
  });

  it("renders closed", () => {
    render(
      <ToggleSection title="Test title" startOpen={false}>
        <p>Some content</p>
      </ToggleSection>,
    );

    expect(screen.getByRole("button")).toBeInTheDocument();
    expect(screen.getByText("Test title")).toBeInTheDocument();
    expect(
      screen.getByText("Some content").closest(".aic-toggle-section"),
    ).toHaveClass("closed");
  });

  it("toggles correctly", async () => {
    const user = userEvent.setup();

    render(
      <ToggleSection title="Test title" startOpen={true}>
        <p>Some content</p>
      </ToggleSection>,
    );
    const body = screen.getByText("Some content").closest(".body")!;

    expect(
      screen.getByText("Some content").closest(".aic-toggle-section"),
    ).not.toHaveClass("closed");

    await user.click(screen.getByRole("button"));
    fireEvent.transitionEnd(body);

    expect(
      screen.getByText("Some content").closest(".aic-toggle-section"),
    ).toHaveClass("closed");
  });
});
