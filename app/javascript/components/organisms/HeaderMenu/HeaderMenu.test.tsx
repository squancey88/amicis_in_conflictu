import React from "react";
import { render, screen } from "@testing-library/react";
import { HeaderMenu } from ".";

jest.mock("Hooks/useBreakpoint", () => ({
  __esModule: true,
  default: () => ({ isMobile: false }),
}));

const defaultProps = {
  logoPath: "/images/logo.png",
  logoHref: "/",
  userPath: "/users/1/edit",
  items: [
    {
      label: "Game Groups",
      items: [
        {
          label: "Group 1",
          href: "/game_groups/1",
        },
      ],
    },
    {
      label: "Characters",
      href: "/chracaters",
    },
  ],
};

describe("HeaderMenu", () => {
  it("renders", () => {
    render(<HeaderMenu {...defaultProps} />);

    expect(
      screen.getByRole("button", { name: "Game Groups" }),
    ).toBeInTheDocument();
    expect(
      screen.getByRole("link", { name: "Characters" }),
    ).toBeInTheDocument();
  });
});
