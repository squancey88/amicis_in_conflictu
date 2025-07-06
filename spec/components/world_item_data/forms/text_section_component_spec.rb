# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorldItemData::Forms::TextSectionComponent, type: :helper do
  include ViewComponent::TestHelpers

  let(:world) { create(:world) }
  let(:article) { create(:article, world:) }

  before do
    form_with model: [world, article] do |form|
      form.fields_for :sections do |section_form|
        render_inline(described_class.new(form: section_form))
      end
    end
  end

  it "should render the editor div" do
    expect(page).to have_css(".text-editor-component")
  end

  it "should render the title input" do
    expect(page).to have_css("input[name*='title']")
  end
end
