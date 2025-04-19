require "rails_helper"

RSpec.describe Quest, type: :model do
  context "associations" do
    it { should belong_to(:world) }
  end
end
