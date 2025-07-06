require "rails_helper"

RSpec.describe LocationType, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "attributes" do
    it { should belong_to(:world) }
  end
end
