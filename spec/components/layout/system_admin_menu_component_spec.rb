# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::SystemAdminMenuComponent, type: :component do
  let(:admin_user) { create(:user, admin: true) }
  let(:user) { create(:user) }

  context "admin user" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(admin_user)
      render_inline(described_class.new)
    end

    it "should render" do
      expect(page).to have_css(".navbar")
    end
  end

  context "regular user" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
      render_inline(described_class.new)
    end

    it "should not render" do
      expect(page).not_to have_css(".navbar")
    end
  end
end
