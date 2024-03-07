require "rails_helper"

RSpec.describe GamingGroup, type: :model do
  let(:gaming_group) { create(:gaming_group, name: "Test") }

  context "attributes" do
    it { expect(gaming_group).to have_attributes(name: "Test") }
  end
end
