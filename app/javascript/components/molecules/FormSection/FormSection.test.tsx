import React from "react";
import { render, screen } from "@testing-library/react";
import FormSection from ".";

describe("FormSection", () => {
  it("renders", () => {
    render(
      <FormSection>
        <input type="text" />
      </FormSection>,
    );

    expect(screen.getByRole("textbox")).toBeInTheDocument();
  });
});
