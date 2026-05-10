import React from "react";
import { render, screen } from "@testing-library/react";
import { Pagination, PaginationValues } from ".";

describe("Pagination", () => {
  const pagination = {
    count: 100,
    limit: 10,
    page: 1,
    last: 10,
  };

  const onChange = jest.fn();

  it("renders", () => {
    render(<Pagination pagination={pagination} onChange={onChange} />);

    expect(screen.getByText("1")).toBeInTheDocument();
  });
});
