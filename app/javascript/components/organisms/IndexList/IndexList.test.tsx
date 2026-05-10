import React from "react";
import { render, screen } from "@testing-library/react";
import { IndexList } from ".";
import type { IndexRecord, DisplayConfigItem } from "Molecules/IndexItem";
import useIndex from "Hooks/useIndex";

interface TestRecord extends IndexRecord {
  name: string;
}

jest.mock("Hooks/useIndex", () => ({
  __esModule: true,
  default: jest.fn(),
}));

const displayConfig: Array<DisplayConfigItem<TestRecord>> = [
  { attribute: "name" },
];

const mockUseIndex = jest.requireMock("Hooks/useIndex").default as jest.Mock;

describe("IndexList", () => {
  beforeEach(() => {
    mockUseIndex.mockReturnValue({
      records: [],
      pagination: null,
      loading: false,
      error: null,
      loadPage: jest.fn(),
    });
  });

  it("renders new link when given new path", () => {
    render(
      <IndexList
        indexPath="/test_records"
        newPath="/test_records"
        displayConfig={displayConfig}
      />,
    );
    expect(screen.getByText("New")).toBeInTheDocument();
  });

  it("renders no new link when not given new path", () => {
    render(
      <IndexList indexPath="/test_records" displayConfig={displayConfig} />,
    );
    expect(screen.queryByText("New")).not.toBeInTheDocument();
  });

  it("renders title when given", () => {
    render(
      <IndexList
        indexPath="/test_records"
        title="Armies"
        displayConfig={displayConfig}
      />,
    );
    expect(screen.getByText("Armies")).toBeInTheDocument();
  });

  it("renders loading state", () => {
    mockUseIndex.mockReturnValue({
      records: [],
      pagination: null,
      loading: true,
      error: null,
      loadPage: jest.fn(),
    });
    render(
      <IndexList indexPath="/test_records" displayConfig={displayConfig} />,
    );
    expect(screen.getByText("Loading...")).toBeInTheDocument();
  });

  it("renders records when loaded", () => {
    mockUseIndex.mockReturnValue({
      records: [{ id: "1", name: "Test Army" }],
      pagination: {
        count: 100,
        limit: 10,
        page: 1,
        last: 10,
      },
      loading: false,
      error: null,
      loadPage: jest.fn(),
    });
    render(
      <IndexList indexPath="/test_records" displayConfig={displayConfig} />,
    );
    expect(screen.getByText("Test Army")).toBeInTheDocument();
  });
});
