import React from "react";
import { render, screen } from "@testing-library/react";
import { TextEditor } from ".";

describe("TextEditor", () => {
  it("renders", () => {
    const { container } = render(
      <TextEditor label="Notes" fieldName="model[notes]" />,
    );

    const input = container.querySelector('input[type="hidden"]');
    expect(input).toBeInTheDocument();
    expect(input.name).toBe("model[notes]");

    expect(screen.getByText("Notes")).toBeInTheDocument();
  });
});
