import React from "react"
import { render, screen } from "@testing-library/react"
import { NewGameMapForm } from "."

describe("NewGameMapForm", () => {
  it("renders", () => {
    render(<NewGameMapForm />)
  })
})
