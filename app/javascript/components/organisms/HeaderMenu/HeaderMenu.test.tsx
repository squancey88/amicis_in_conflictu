import React from "react"
import { render, screen } from "@testing-library/react"
import { HeaderMenu } from "."

describe("HeaderMenu", () => {
  it("renders", () => {
    render(<HeaderMenu />)
  })
})
