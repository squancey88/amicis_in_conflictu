import React from "react";
import { render, screen } from "@testing-library/react";
import { DisplayConfigItem, IndexItem, IndexRecord } from ".";

describe("IndexItem", () => {
  interface TestRecord extends IndexRecord {
    name: string;
  }

  const record = {
    id: "test",
    name: "Test Name",
    show_path: "/test/1",
    edit_path: "/test/1",
  } as TestRecord;
  const displayConfig = [
    { attribute: "name" } as DisplayConfigItem<TestRecord>,
  ];

  it("renders", () => {
    render(<IndexItem record={record} displayConfig={displayConfig} />);

    expect(screen.getByText("Test Name")).toBeInTheDocument();
  });
});
