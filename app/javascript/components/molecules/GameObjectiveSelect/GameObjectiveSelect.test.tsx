import React from "react"
import { render, screen } from "@testing-library/react"
import { GameObjectiveSelect } from "."

describe("GameObjectiveSelect", () => {
  it("renders", () => {
    render(<GameObjectiveSelect />)
  })
})
