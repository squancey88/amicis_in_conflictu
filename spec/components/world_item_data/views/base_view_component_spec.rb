# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorldItemData::Views::BaseViewComponent, type: :component do
  let(:owner) { create(:user) }
  let(:normal_user) { create(:user) }

  let(:world) { create(:world, owner:) }

  let(:article) { create(:article, world:) }
  let(:gm_only_world_item) { create(:text_section, relates_to: article, visibility: :gm_only) }
  let(:visible_world_item) { create(:text_section, relates_to: article, visibility: :visible) }

  context "as owner user" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
    end

    it "should render gm_only" do
      component = described_class.new(gm_only_world_item)
      render_inline(component)
      expect(component.render?).to be true
    end

    it "should render visible" do
      component = described_class.new(visible_world_item)
      render_inline(component)
      expect(component.render?).to be true
    end
  end

  context "as normal user" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(normal_user)
    end

    it "should not render gm_only" do
      component = described_class.new(gm_only_world_item)
      render_inline(component)
      expect(component.render?).to be false
    end

    it "should render visible" do
      component = described_class.new(visible_world_item)
      render_inline(component)
      expect(component.render?).to be true
    end
  end
end
