require "rails_helper"

RSpec.describe RecordFormWrapperComponent, type: :component_form do
  let(:game) { create(:game) }

  context "standard view" do
    before do
      form_with model: game do |form|
        render_inline(described_class.new(form:, record: game)) { |comp|
          comp.with_form_box { "Test" }
        }
      end
    end

    it "should render grid" do
      expect(page).to have_css(".aic-grid")
    end

    it "should not render notice" do
      expect(page).not_to have_css("div.alert.alert_secondary")
    end
  end

  context "with notice" do
    before do
      form_with model: game do |form|
        render_inline(described_class.new(form:, record: game)) { |comp|
          comp.with_form_box { "Test" }
          comp.with_notice(notice: "Warning you messed up")
        }
      end
    end

    it "should render grid" do
      expect(page).to have_css(".aic-grid")
    end

    it "should render notice" do
      expect(page).to have_css("div.alert.alert-secondary")
      expect(page).to have_text("Warning you messed up")
    end
  end
end
