import React from "react"
import { render, screen } from "@testing-library/react"
import { TurnBasedGameTableHeader } from "."

describe("TurnBasedGameTableHeader", () => {
  it("renders", () => {
    render(<TurnBasedGameTableHeader />)
  })
})
