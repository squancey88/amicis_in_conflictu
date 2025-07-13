# frozen_string_literal: true

require "rails_helper"

RSpec.describe Forms::ArrayFieldComponent, type: :component_form do
  let(:world) { create(:world) }

  before do
    form_with model: [world, character] do |form|
      form.fields_for :config, OpenStruct.new(character.config) do |config_form|
        render_inline(described_class.new(form: config_form, field: "sub_domains", label: "Sub Domains", required:))
      end
    end
  end

  describe "when not required" do
    let(:required) { false }

    describe "when value is blank" do
      let(:character) { create(:character, world:) }

      it "should render the wrapper div" do
        expect(page).to have_css(".array-field")
      end

      it "should render add button" do
        expect(page).to have_selector(:testid, "forms-array-field-component-add-button")
      end

      it "does not render input field" do
        expect(page).not_to have_css("input[name='character[config][sub_domains][]']")
      end
    end
  end

  describe "when required" do
    let(:required) { true }

    describe "when value is blank" do
      let(:character) { create(:character, world:) }

      it "should render the wrapper div" do
        expect(page).to have_css(".array-field")
      end

      it "should render add button" do
        expect(page).to have_selector(:testid, "forms-array-field-component-add-button")
      end

      it "does render input field" do
        expect(page).to have_css("input[name='character[config][sub_domains][]'][required]")
      end

      it "should render remove button" do
        expect(page).to have_selector(:testid, "forms-array-field-component-remove-button")
      end
    end
  end
end
