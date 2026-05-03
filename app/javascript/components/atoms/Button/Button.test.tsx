import React from "react"
import { render, screen } from "@testing-library/react"
import Button from "."

describe("Button", () => {
  it("renders", () => {
    render(<Button />)
  })
})
