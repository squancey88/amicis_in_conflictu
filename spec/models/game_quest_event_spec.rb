require "rails_helper"

RSpec.describe GameQuestEvent, type: :model do
  let(:game) { create(:game) }
  let(:quest_event) { create(:quest_event) }

  context "associations" do
    it { should belong_to(:game) }
    it { should belong_to(:quest_event) }
  end
end
