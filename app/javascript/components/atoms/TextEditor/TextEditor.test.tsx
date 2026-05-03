import React from "react"
import { render, screen } from "@testing-library/react"
import TextEditor from "."

describe("TextEditor", () => {
  it("renders", () => {
    render(<TextEditor />)
  })
})
