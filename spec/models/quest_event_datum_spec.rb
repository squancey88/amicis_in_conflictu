require "rails_helper"

RSpec.describe QuestEventDatum, type: :model do
  context "associations" do
    it { should belong_to(:quest_event) }
  end
end
