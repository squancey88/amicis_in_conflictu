import React from "react";
import { render, screen } from "@testing-library/react";
import { Button } from ".";
import userEvent from "@testing-library/user-event";

const onClick = jest.fn();

describe("Button", () => {
  beforeEach(() => {
    onClick.mockReset();
  });

  it("renders primary button", () => {
    render(<Button variant="primary" label="Test" onClick={onClick} />);

    expect(screen.getByRole("button", { name: "Test" })).toBeInTheDocument();
    expect(screen.getByRole("button")).toHaveClass("btn btn-primary");
  });

  it("renders secondary button", () => {
    render(<Button variant="secondary" label="Test" onClick={onClick} />);

    expect(screen.getByRole("button", { name: "Test" })).toBeInTheDocument();
    expect(screen.getByRole("button")).toHaveClass("btn btn-secondary");
  });

  it("clicking calls function", async () => {
    const user = userEvent.setup();
    render(<Button variant="secondary" label="Test" onClick={onClick} />);

    await user.click(screen.getByRole("button"));

    expect(onClick).toHaveBeenCalledTimes(1);
  });
});
