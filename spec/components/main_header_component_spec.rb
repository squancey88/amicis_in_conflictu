# frozen_string_literal: true

require "rails_helper"

RSpec.describe MainHeaderComponent, type: :component do
  let(:user) { create(:user) }

  context "when logged in" do
    before do
      allow_any_instance_of(MainHeaderComponent).to receive(:current_user).and_return(user)
    end

    it "should render header" do
      render_inline(described_class.new)
      expect(page).to have_css(".navbar")
      expect(page).to have_text "Amicis in Conflictu"
    end
  end

  context "when not logged in" do
    before do
      allow_any_instance_of(MainHeaderComponent).to receive(:current_user).and_return(nil)
      render_inline(described_class.new)
    end

    it "should not render when no current_user" do
      expect(page).to have_no_selector(".navbar")
    end
  end
end
