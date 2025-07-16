# frozen_string_literal: true

require "rails_helper"

RSpec.describe Characters::CustomFieldGridViewComponent, type: :component do
  let(:user) { create(:user) }
  before do
    render_inline(described_class.new(character:))
  end

  describe "having neither config" do
    let(:world) {
      create(:world, owner: user, config: {})
    }
    let(:character_type) {
      create(:character_type, world:, config: {})
    }
    let(:character) {
      create(:character, world:, character_type:,
        config: {
          "sub_domains" => ["Sea", "Sun"]
        })
    }

    it "renders nothing" do
      result = render_inline(described_class.new(character:))
      expect(result.to_html.strip).to be_empty
    end
  end

  describe "only type having config options" do
    let(:world) {
      create(:world, owner: user, config: {})
    }
    let(:character_type) {
      create(:character_type, world:, config: {
        "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
      })
    }
    let(:character) {
      create(:character, world:, character_type:,
        config: {
          "sub_domains" => ["Sea", "Sun"]
        })
    }

    it "renders labels for all options" do
      expect(page).to have_text("Domains")
    end

    it "renders values for given values" do
      expect(page).to have_css(".custom-field__value", text: "Sea, Sun")
    end
  end

  describe "only world and type having config options" do
    let(:world) {
      create(:world, owner: user, config: {
        "character_config" => {
          "custom_fields" => [
            {"key" => "infected", "name" => "Infected", "type" => "boolean", "required" => true},
            {"key" => "category", "name" => "Category", "type" => "string", "required" => false}
          ]
        }
      })
    }
    let(:character_type) {
      create(:character_type, world:, config: {})
    }
    let(:character) {
      create(:character, world:, character_type:,
        config: {
          "infected" => false
        })
    }

    it "renders labels for all options" do
      expect(page).to have_text("Infected")
      expect(page).to have_text("Category")
    end

    it "renders values for given values" do
      expect(page).to have_css(".custom-field__value", text: "No")
    end

    it "renders dashes for missing values" do
      expect(page).to have_css(".custom-field__value", text: "---")
    end
  end

  describe "with both world and type having config options" do
    let(:world) {
      create(:world, owner: user, config: {
        "character_config" => {
          "custom_fields" => [
            {"key" => "infected", "name" => "Infected", "type" => "boolean", "required" => true},
            {"key" => "category", "name" => "Category", "type" => "string", "required" => false}
          ]
        }
      })
    }
    let(:character_type) {
      create(:character_type, world:, config: {
        "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
      })
    }
    let(:character) {
      create(:character, world:, character_type:,
        config: {
          "infected" => false,
          "sub_domains" => ["Sea", "Sun"]
        })
    }

    it "renders labels for all options" do
      expect(page).to have_text("Infected")
      expect(page).to have_text("Category")
      expect(page).to have_text("Domains")
    end

    it "renders values for given values" do
      expect(page).to have_css(".custom-field__value", text: "No")
      expect(page).to have_css(".custom-field__value", text: "Sea, Sun")
    end

    it "renders dashes for missing values" do
      expect(page).to have_css(".custom-field__value", text: "---")
    end
  end
end
