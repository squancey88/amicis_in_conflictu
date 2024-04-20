require "rails_helper"

RSpec.describe ErrorPanelComponent, type: :component do
  context "without errors" do
    before do
      render_inline(described_class.new(model_name: "Test Model", errors: []))
    end

    it "doesnt render if there are no errors" do
      expect(page).to have_no_selector(".error-panel")
    end
  end

  context "with errors" do
    let(:error) {
      error_instance = double
      allow(error_instance).to receive(:full_message).and_return("Some random text")
      error_instance
    }

    before do
      render_inline(described_class.new(model_name: "Test Model", errors: [error]))
    end

    it "should show when errors present" do
      expect(page).to have_css(".error-panel")
    end

    it "should show a list of errors" do
      expect(page).to have_css("ul")
    end
  end
end
