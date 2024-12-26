require "rails_helper"

RSpec.describe Character, type: :model do
  context "validations" do
    it { should validate_presence_of(:given_name) }
  end

  context "attributes" do
    it { should belong_to(:character_type) }
  end
end
