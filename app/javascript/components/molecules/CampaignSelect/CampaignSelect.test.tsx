import React from "react";
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import CampaignSelect from "./CampaignSelect";
import type { CampaignsByGameSystem } from "Types/common";

describe("CampaignSelect", () => {
  const mockCampaignsByGameSystem: Array<CampaignsByGameSystem> = [
    {
      gameSystemId: "game-1",
      campaigns: [
        { id: "campaign-1", name: "Campaign One" },
        { id: "campaign-2", name: "Campaign Two" },
      ],
    },
    {
      gameSystemId: "game-2",
      campaigns: [{ id: "campaign-3", name: "Campaign Three" }],
    },
  ];

  it('renders with default "Please Select" option when no selectedId', () => {
    render(
      <CampaignSelect
        fieldName="test"
        campaignsByGameSystem={mockCampaignsByGameSystem}
        selectedId={undefined}
      />,
    );

    expect(screen.getByRole("combobox")).toBeInTheDocument();
    expect(screen.getByText("Please Select")).toBeInTheDocument();
    expect(screen.queryByText("Campaign One")).not.toBeInTheDocument();
  });

  it("shows campaigns for the selected game system", () => {
    render(
      <CampaignSelect
        fieldName="test"
        campaignsByGameSystem={mockCampaignsByGameSystem}
        selectedId="game-1"
      />,
    );

    expect(screen.getByText("Campaign One")).toBeInTheDocument();
    expect(screen.getByText("Campaign Two")).toBeInTheDocument();
    expect(screen.queryByText("Campaign Three")).not.toBeInTheDocument();
  });

  it("shows different campaigns when selectedId changes", () => {
    const { rerender } = render(
      <CampaignSelect
        fieldName="test"
        campaignsByGameSystem={mockCampaignsByGameSystem}
        selectedId="game-1"
      />,
    );

    expect(screen.getByText("Campaign One")).toBeInTheDocument();

    rerender(
      <CampaignSelect
        fieldName="test"
        campaignsByGameSystem={mockCampaignsByGameSystem}
        selectedId="game-2"
      />,
    );

    expect(screen.queryByText("Campaign One")).not.toBeInTheDocument();
    expect(screen.getByText("Campaign Three")).toBeInTheDocument();
  });

  it("shows no campaigns when selectedId does not match any game system", () => {
    render(
      <CampaignSelect
        fieldName="test"
        campaignsByGameSystem={mockCampaignsByGameSystem}
        selectedId="non-existent-id"
      />,
    );

    expect(screen.getByText("Please Select")).toBeInTheDocument();
    expect(screen.queryByText("Campaign One")).not.toBeInTheDocument();
    expect(screen.queryByText("Campaign Two")).not.toBeInTheDocument();
    expect(screen.queryByText("Campaign Three")).not.toBeInTheDocument();
  });

  it("renders empty list when campaignsByGameSystem is empty", () => {
    render(
      <CampaignSelect
        fieldName="test"
        campaignsByGameSystem={[]}
        selectedId="game-1"
      />,
    );

    expect(screen.getByText("Please Select")).toBeInTheDocument();
    const options = screen.getAllByRole("option");
    expect(options).toHaveLength(1); // Only "Please Select"
  });
});
