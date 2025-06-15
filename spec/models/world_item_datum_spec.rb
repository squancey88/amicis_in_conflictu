require "rails_helper"

RSpec.describe WorldItemDatum, type: :model do
  context "associations" do
    it { should belong_to(:relates_to) }
  end
end
