import React from "react";
import { render, screen } from "@testing-library/react";
import { TextInput } from ".";

describe("TextInput", () => {
  it("renders", () => {
    render(
      <TextInput
        fieldName="test[test]"
        label="Text input"
        value="start value"
      />,
    );

    expect(
      screen.getByRole("textbox", {
        name: "Text input",
      }),
    ).toBeInTheDocument();
  });
});
