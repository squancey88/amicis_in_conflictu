import React from "react";
import { render } from "@testing-library/react";
import { Icon } from ".";

describe("Icon", () => {
  it("renders", () => {
    const { container } = render(<Icon name="test" />);
    const icon = container.querySelector(".bi-test");
    expect(icon).toBeInTheDocument();
  });
});
