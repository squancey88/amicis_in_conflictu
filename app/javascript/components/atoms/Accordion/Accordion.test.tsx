import React from "react"
import { render, screen } from "@testing-library/react"
import Accordion from "."

describe("Accordion", () => {
  it("renders", () => {
    render(<Accordion />)
  })
})
