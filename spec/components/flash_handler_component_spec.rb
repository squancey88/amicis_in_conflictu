require "rails_helper"

RSpec.describe FlashHandlerComponent, type: :component do
  context "with notice" do
    before do
      render_inline(described_class.new({notice: "notice test"}))
    end

    it "should display" do
      expect(page).to have_css(".alert-container")
      expect(page).to have_css(".alert-primary", text: "notice test")
    end
  end

  context "with alert" do
    before do
      render_inline(described_class.new({alert: "alert test"}))
    end

    it "should display" do
      expect(page).to have_css(".alert-container")
      expect(page).to have_css(".alert-danger", text: "alert test")
    end
  end
end
