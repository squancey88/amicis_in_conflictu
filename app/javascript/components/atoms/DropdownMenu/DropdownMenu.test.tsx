import React, { ComponentProps } from "react";
import { render, screen } from "@testing-library/react";
import { DropdownMenu } from ".";
import useBreakpoint from "Hooks/useBreakpoint";

jest.mock("Hooks/useBreakpoint");
const mockUseBreakpoint = useBreakpoint as jest.Mock;

describe("DropdownMenu", () => {
  const defaultProps: ComponentProps<typeof DropdownMenu> = {
    label: "Test Dropdown",
    items: [],
  };

  afterEach(() => {
    jest.clearAllMocks();
  });

  it("renders", () => {
    mockUseBreakpoint.mockReturnValue({ isMobile: false });
    render(<DropdownMenu {...defaultProps} />);

    expect(screen.getByText("Test Dropdown")).toBeInTheDocument();
  });
});
