import React from "react"
import { render, screen } from "@testing-library/react"
import TextInput from "."

describe("TextInput", () => {
  it("renders", () => {
    render(<TextInput />)
  })
})
