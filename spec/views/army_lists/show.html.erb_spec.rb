require "rails_helper"

RSpec.describe "army_lists/show", type: :view do
  let(:army) { create(:army) }
  let(:campaign) { create(:campaign, name: "Army list test") }

  context "without campaign" do
    let(:army_list) { create(:army_list, name: "Name", army:) }
    before(:each) do
      assign(:army_list, army_list)
      assign(:presenter, ArmyListPresenter.new(double, army_list))
    end

    it "renders attributes in <p>" do
      render
      expect(rendered).to match(/Name/)
    end
  end

  context "without campaign" do
    let(:army_list) { create(:army_list, name: "Name", army:, campaign:) }
    before(:each) do
      assign(:army_list, army_list)
      assign(:presenter, ArmyListPresenter.new(double, army_list))
      render
    end

    it "renders attributes in <p>" do
      expect(rendered).to match(/Name/)
    end

    it "renders the campaign name" do
      expect(rendered).to match(/Army list test/)
    end
  end
end
