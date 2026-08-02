import React from "react"
import { render, screen } from "@testing-library/react"
import { GameObjectiveSelector } from "."

describe("GameObjectiveSelector", () => {
  it("renders", () => {
    render(<GameObjectiveSelector />)
  })
})
