import { render, screen } from "@testing-library/react";
import { Tab } from ".";
import { useTabsContext } from "Organisms/Tabs/Tabs";

jest.mock("Organisms/Tabs/Tabs", () => ({
  useTabsContext: jest.fn(),
}));

const mockUseTabsContext = useTabsContext as jest.Mock;

describe("Tab", () => {
  it("renders when not active", () => {
    mockUseTabsContext.mockReturnValue({ active: "first-tab", select: jest.fn() });

    render(<Tab id="test-panel">Test</Tab>);

    expect(screen.getByRole("tabpanel")).toBeInTheDocument();
    expect(screen.getByText("Test")).toBeInTheDocument();
    expect(screen.getByRole("tabpanel")).toHaveClass("tab-panel");
    expect(screen.getByRole("tabpanel")).not.toHaveClass("active-panel");
  });

  it("renders when active", () => {
    mockUseTabsContext.mockReturnValue({ active: "test-panel", select: jest.fn() });

    render(<Tab id="test-panel">Test</Tab>);

    expect(screen.getByRole("tabpanel")).toBeInTheDocument();
    expect(screen.getByText("Test")).toBeInTheDocument();
    expect(screen.getByRole("tabpanel")).toHaveClass("tab-panel");
    expect(screen.getByRole("tabpanel")).toHaveClass("active-panel");
  });
});
