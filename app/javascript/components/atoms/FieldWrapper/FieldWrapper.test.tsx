import React from "react";
import { render, screen } from "@testing-library/react";
import { FieldWrapper } from ".";

describe("FieldWrapper", () => {
  it("renders", () => {
    render(
      <FieldWrapper label="Test" id="test-1">
        <input type="text" id="test-1" />
      </FieldWrapper>,
    );

    expect(screen.getByRole("textbox", { name: "Test" })).toBeInTheDocument();
  });
});
