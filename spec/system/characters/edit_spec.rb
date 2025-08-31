require "rails_helper"

RSpec.describe("Edit Character", type: :system) do
  let(:character_type) {
    create(:character_type, world:, config: {
      "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
    })
  }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    visit edit_world_character_path(world, character)
  end

  context "as world owner" do
    let(:user) { create(:user) }
    let(:world) { create(:world, owner: user) }
    let(:character) { create(:character, world:, character_type:) }

    it "should have key form fields" do
      expect(page).to have_css("input[name='character[given_name]']")
      expect(page).to have_css("input[name='character[family_name]']")
    end

    it "allows updating of main fields" do
      fill_in "Title", with: "New Title"
      fill_in "Nickname", with: "New Nickname"
      fill_in "Given name", with: "New Name"
      fill_in "Family name", with: "New Family Name"

      click_on "Update Character"

      expect(page).to have_current_path(world_character_path(world, character))

      character.reload
      expect(character.title).to eq("New Title")
      expect(character.nickname).to eq("New Nickname")
      expect(character.given_name).to eq("New Name")
      expect(character.family_name).to eq("New Family Name")
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

  context "as character player" do
    let(:user) { create(:user) }
    let(:world) { create(:world) }
    let!(:player_type) {
      type = world.player_type
      type.update!(config: {
        "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
      })
      type
    }
    let(:character) { create(:character, given_name: "Player", character_type: player_type, controlled_by: user, world:) }

    it "should have key form fields" do
      expect(page).to have_css("input[name='character[given_name]']")
      expect(page).to have_css("input[name='character[family_name]']")
    end

    it "allows updating of main fields" do
      fill_in "Title", with: "New Title"
      fill_in "Nickname", with: "New Nickname"
      fill_in "Given name", with: "New Name"
      fill_in "Family name", with: "New Family Name"

      click_on "Update Character"

      expect(page).to have_current_path(world_character_path(world, character))

      character.reload
      expect(character.title).to eq("New Title")
      expect(character.nickname).to eq("New Nickname")
      expect(character.given_name).to eq("New Name")
      expect(character.family_name).to eq("New Family Name")
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

  context "as neither character player or owner" do
    let(:user) { create(:user) }
    let(:world) { create(:world) }
    let!(:player_type) {
      type = world.player_type
      type.update!(config: {
        "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
      })
      type
    }
    let(:character) { create(:character, given_name: "Player", character_type: player_type, world:) }

    it "should direct to world show" do
      expect(page).to have_current_path(world_path(world))
    end
  end
end
