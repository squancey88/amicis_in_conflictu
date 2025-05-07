require "rails_helper"

RSpec.describe Article, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  context "associations" do
    it { should belong_to(:world) }
  end
end
