import React from "react"
import { render, screen } from "@testing-library/react"
import { GameMapViewer } from "."

describe("GameMapViewer", () => {
  it("renders", () => {
    render(<GameMapViewer />)
  })
})
