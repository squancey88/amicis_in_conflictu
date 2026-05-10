import React from "react"
import { render, screen } from "@testing-library/react"
import { Pagination } from "."

describe("Pagination", () => {
  it("renders", () => {
    render(<Pagination />)
  })
})
