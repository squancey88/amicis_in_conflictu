require "rails_helper"

RSpec.describe("Edit Article", type: :system) do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }
  let(:character_type) {
    create(:character_type, world:, config: {
      "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
    })
  }
  let(:character) { create(:character, world:, character_type:) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    visit edit_world_character_path(world, character)
  end

  it "should have key form fields" do
    expect(page).to have_css("input[name='character[given_name]']")
    expect(page).to have_css("input[name='character[family_name]']")
  end

  describe "custom array field" do
    it "should display add button" do
      expect(page).to have_selector(:testid, "forms-array-field-component-add-button")
    end

    it "clicking add button should add new row" do
      find(:testid, "forms-array-field-component-add-button").click
      expect(page).to have_css("input[name='character[config][sub_domains][]']")
    end

    it "clicking add button, then remove button, should remove row" do
      find(:testid, "forms-array-field-component-add-button").click
      find(:testid, "forms-array-field-component-remove-button").click
      expect(page).not_to have_css("input[name='character[config][sub_domains][]']")
    end

    it "adding row and data updates model" do
      find(:testid, "forms-array-field-component-add-button").click
      find("input[name='character[config][sub_domains][]']").fill_in(with: "Test 1")

      click_on "Update Character"
      sleep(0.5)

      expect(page).to have_current_path(world_character_path(world, character))
      character.reload
      expect(character.config["sub_domains"]).to eq(["Test 1"])
    end

    it "adding multiple rows and data updates model" do
      find(:testid, "forms-array-field-component-add-button").click
      find(:testid, "forms-array-field-component-add-button").click

      inputs = all("input[name='character[config][sub_domains][]']")

      inputs.each_with_index do |input, i|
        input.fill_in with: "Test #{i + 1}"
      end

      click_on "Update Character"
      sleep(0.5)

      expect(page).to have_current_path(world_character_path(world, character))
      character.reload
      expect(character.config["sub_domains"]).to eq(["Test 1", "Test 2"])
    end
  end
end
