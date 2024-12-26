require "rails_helper"

RSpec.describe TimePeriod, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:order) }
  end
end
