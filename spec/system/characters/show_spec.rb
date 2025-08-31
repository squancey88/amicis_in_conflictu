require "rails_helper"

RSpec.describe("Show Character", type: :system) do
  let(:owner) { create(:user) }
  let(:player) { create(:user) }
  let(:other_user) { create(:user) }
  let(:world) { create(:world, owner:) }
  let(:character_type) {
    create(:character_type, world:, config: {
      "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
    })
  }
  let!(:player_type) {
    type = world.player_type
    type.update!(config: {
      "custom_fields" => [{"key" => "sub_domains", "name" => "Domains", "type" => "array", "required" => false}]
    })
    type
  }

  let(:player_character) {
    create(:character, given_name: "Player", character_type: player_type,
      controlled_by: player, world:,
      world_owner_notes: generate_text_section,
      player_notes: generate_text_section,
      shared_notes: generate_text_section)
  }

  let(:character) {
    create(:character, world:, character_type:,
      world_owner_notes: generate_text_section)
  }

  context "as world owner" do
    context "viewing non player character" do
      before do
        allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
        visit world_character_path(world, character)
      end

      it "should key information" do
        expect(page).to have_css("h1", text: character.full_name)
      end

      it "shows owner notes" do
        expect(page).to have_css("div[data-test-world-owner-notes='true']")
      end

      it "shows shared notes" do
        expect(page).not_to have_css("div[data-test-shared-notes='true']")
      end

      it "does not show player notes" do
        expect(page).not_to have_css("div[data-test-player-notes='true']")
      end
    end

    context "viewing player character" do
      before do
        allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
        visit world_character_path(world, player_character)
      end

      it "should key information" do
        expect(page).to have_css("h1", text: player_character.full_name)
      end

      it "shows owner notes" do
        expect(page).to have_css("div[data-test-world-owner-notes='true']")
      end

      it "shows shared notes" do
        expect(page).to have_css("div[data-test-shared-notes='true']")
      end

      it "does not show player notes" do
        expect(page).not_to have_css("div[data-test-player-notes='true']")
      end
    end

    context "as character player" do
      context "viewing non player character" do
        before do
          allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(player)
          visit world_character_path(world, character)
        end

        it "should key information" do
          expect(page).to have_css("h1", text: character.full_name)
        end

        it "does not show owner notes" do
          expect(page).not_to have_css("div[data-test-world-owner-notes='true']")
        end

        it "does not shows shared notes" do
          expect(page).not_to have_css("div[data-test-shared-notes='true']")
        end

        it "shows player notes" do
          expect(page).not_to have_css("div[data-test-player-notes='true']")
        end
      end

      context "viewing player character" do
        before do
          allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(player)
          visit world_character_path(world, player_character)
        end

        it "should key information" do
          expect(page).to have_css("h1", text: player_character.full_name)
        end

        it "does not show owner notes" do
          expect(page).not_to have_css("div[data-test-world-owner-notes='true']")
        end

        it "shows shared notes" do
          expect(page).to have_css("div[data-test-shared-notes='true']")
        end

        it "shows player notes" do
          expect(page).to have_css("div[data-test-player-notes='true']")
        end
      end
    end

    context "as neither character player or owner" do
      context "viewing non player character" do
        before do
          allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(other_user)
          visit world_character_path(world, character)
        end

        it "should key information" do
          expect(page).to have_css("h1", text: character.full_name)
        end

        it "does not show owner notes" do
          expect(page).not_to have_css("div[data-test-world-owner-notes='true']")
        end

        it "does not show shared notes" do
          expect(page).not_to have_css("div[data-test-shared-notes='true']")
        end

        it "does not show player notes" do
          expect(page).not_to have_css("div[data-test-player-notes='true']")
        end
      end

      context "viewing player character" do
        before do
          allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(other_user)
          visit world_character_path(world, player_character)
        end

        it "should key information" do
          expect(page).to have_css("h1", text: player_character.full_name)
        end

        it "does not show owner notes" do
          expect(page).not_to have_css("div[data-test-world-owner-notes='true']")
        end

        it "does not show shared notes" do
          expect(page).not_to have_css("div[data-test-shared-notes='true']")
        end

        it "does not show player notes" do
          expect(page).not_to have_css("div[data-test-player-notes='true']")
        end
      end
    end
  end
end
