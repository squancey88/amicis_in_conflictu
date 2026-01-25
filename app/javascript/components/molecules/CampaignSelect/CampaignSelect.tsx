import React from "react";
import { CampaignsByGameSystem, Campaign } from "Types/common";
import { Select, SelectProps } from "Atoms/Select";

export interface CampaignSelectProps extends SelectProps {
  campaignsByGameSystem: Array<CampaignsByGameSystem>;
  selectedId: string | undefined;
}

const CampaignSelect = ({
  campaignsByGameSystem,
  selectedId,
  ...props
}: CampaignSelectProps) => {
  const filteredCampaigns = selectedId ? findCampaign(selectedId) : [];

  function findCampaign(selectedId: string): Array<Campaign> {
    const match = campaignsByGameSystem.find(
      (group) => group.gameSystemId === selectedId,
    );
    if (match) {
      return match.campaigns;
    } else {
      return [];
    }
  }

  return (
    <div>
      <Select {...props}>
        <option value="">Please Select</option>
        {filteredCampaigns.map((campaign) => (
          <option value={campaign.id} key={campaign.id}>
            {campaign.name}
          </option>
        ))}
      </Select>
    </div>
  );
};

export default CampaignSelect;
