require "rails_helper"

RSpec.describe QuestEvent, type: :model do
  context "associations" do
    it { should belong_to(:quest) }
  end
end
