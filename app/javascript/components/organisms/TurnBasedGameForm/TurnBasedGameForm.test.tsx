import React from "react"
import { render, screen } from "@testing-library/react"
import { TurnBasedGameForm } from "."

describe("TurnBasedGameForm", () => {
  it("renders", () => {
    render(<TurnBasedGameForm />)
  })
})
