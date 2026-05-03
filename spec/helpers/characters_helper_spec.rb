require "rails_helper"

RSpec.describe CharactersHelper, type: :helper do
  let(:world) { create(:world) }
  let(:character) { create(:character, world:) }

  it "should render type select" do
    form_res = form_with model: [world, Character.new] do |form|
      helper.character_type_select(form, :type_id, world)
    end
    expect(form_res).to have_css("select")
  end

  it "should render species select" do
    form_res = form_with model: [world, Character.new] do |form|
      helper.character_species_type_select(form, :species_type_id, world)
    end
    expect(form_res).to have_css("select")
  end

  describe "custom fields" do
    it "renders string field" do
      form_res = form_with model: [world, character] do |form|
        helper.character_custom_field(form,
          {"type" => "string", "key" => "test", "required" => false, "name" => "Test Field"},
          character)
      end
      expect(form_res).to have_css("input[name='character[test]'][type='text']")
      expect(form_res).to have_css("label", text: "Test Field")
    end

    it "renders string field with required" do
      form_res = form_with model: [world, character] do |form|
        helper.character_custom_field(form,
          {"type" => "string", "key" => "test", "required" => true, "name" => "Test Field"},
          character)
      end
      expect(form_res).to have_css("input[name='character[test]'][type='text'][required]")
      expect(form_res).to have_css("label", text: "Test Field")
    end

    it "renders integer field" do
      form_res = form_with model: [world, character] do |form|
        helper.character_custom_field(form,
          {"type" => "integer", "key" => "number_field", "required" => false, "name" => "Test Number"},
          character)
      end
      expect(form_res).to have_css("input[name='character[number_field]'][type='number']")
      expect(form_res).to have_css("label", text: "Test Number")
    end

    it "renders boolean field" do
      form_res = form_with model: [world, character] do |form|
        helper.character_custom_field(form,
          {"type" => "boolean", "key" => "infected", "required" => false, "name" => "Infected"},
          character)
      end
      expect(form_res).to have_css("input[name='character[infected]'][type='checkbox']")
      expect(form_res).to have_css("label", text: "Infected")
    end
  end
end
