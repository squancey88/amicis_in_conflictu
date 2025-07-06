require "rails_helper"

RSpec.describe "/characters", type: :request do
  let(:user) { create(:user) }
  let(:world) {
    create(:world,
      owner: user,
      character_config: {"custom_fields" => [{"key" => "infected", "name" => "Infected", "type" => "boolean", "required" => true}]})
  }
  let!(:character) { create(:character, world:) }
  let(:character_type) { create(:character_type, world:) }
  let(:character_species_type) { create(:character_species_type, world:) }
  let(:time_period) { create(:time_period, world:) }

  let(:other_user) { create(:user) }
  let!(:other_user_character) { create(:character, world:, character_species_type:, character_type: world.player_type, controlled_by: other_user) }

  context "current user is world owner" do
    let(:valid_attributes) {
      {
        given_name: Faker::Name.first_name,
        character_type_id: character_type.id,
        character_species_type_id: character_species_type.id,
        born_during_id: time_period.id,
        config: {
          infected: true,
          animal_form: "bear"
        }
      }
    }

    let(:invalid_attributes) {
      {
        character_type_id: nil,
        character_species_type_id: nil
      }
    }

    before do
      sign_in(user)
      start_world_builder_mode(world)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get world_characters_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get world_character_url(world, character)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_world_character_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_world_character_url(world, character)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Character" do
          expect {
            post world_characters_url(world), params: {character: valid_attributes}
          }.to change(Character, :count).by(1)
        end

        it "redirects to the created character" do
          post world_characters_url(world), params: {character: valid_attributes}
          expect(response).to redirect_to(world_character_url(world, Character.order(:created_at).last))
        end

        it "sets the world correctly" do
          post world_characters_url(world), params: {character: valid_attributes}
          expect(Character.order(:created_at).last.world).to eq(world)
        end

        it "set config correctly" do
          post world_characters_url(world), params: {character: valid_attributes}
          expect(Character.order(:created_at).last.config).to eq({"infected" => "true", "animal_form" => "bear"})
        end
      end

      context "with invalid parameters" do
        it "does not create a new Character" do
          expect {
            post world_characters_url(world), params: {character: invalid_attributes}
          }.to change(Character, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post world_characters_url(world), params: {character: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            given_name: "New given name"
          }
        }

        it "updates the requested character" do
          patch world_character_url(world, character), params: {character: new_attributes}
          character.reload
          expect(character.given_name).to eq("New given name")
        end

        it "redirects to the character" do
          patch world_character_url(world, character), params: {character: new_attributes}
          character.reload
          expect(response).to redirect_to(world_character_url(world, character))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch world_character_url(world, character), params: {character: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested character" do
        expect {
          delete world_character_url(world, character)
        }.to change(Character, :count).by(-1)
      end

      it "redirects to the characters list" do
        delete world_character_url(world, character)
        expect(response).to redirect_to(world_url(world))
      end
    end
  end

  context "current user is not world owner" do
    let(:valid_attributes) {
      {
        given_name: Faker::Name.first_name,
        character_species_type_id: character_species_type.id,
        world_id: world.id
      }
    }

    let(:invalid_attributes) {
      {
        character_type_id: nil
      }
    }

    before do
      sign_in(other_user)
    end

    describe "GET /show" do
      it "renders a successful response" do
        get world_character_url(world, other_user_character)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_world_character_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_world_character_url(world, other_user_character)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Character" do
          expect {
            post world_characters_url(world), params: {character: valid_attributes}
          }.to change(Character, :count).by(1)
        end

        it "redirects to the created character" do
          post world_characters_url(world), params: {character: valid_attributes}
          expect(response).to redirect_to(world_character_url(world, Character.order(:created_at).last))
        end

        it "sets the world correctly" do
          post world_characters_url(world), params: {character: valid_attributes}
          expect(Character.order(:created_at).last.world).to eq(world)
        end
      end

      context "with invalid parameters" do
        it "does not create a new Character" do
          expect {
            post world_characters_url(world), params: {character: invalid_attributes}
          }.to change(Character, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post world_characters_url(world), params: {character: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            given_name: "New given name"
          }
        }

        it "updates the requested character" do
          patch world_character_url(world, other_user_character), params: {character: new_attributes}
          other_user_character.reload
          expect(other_user_character.given_name).to eq("New given name")
        end

        it "redirects to the character" do
          patch world_character_url(world, other_user_character), params: {character: new_attributes}
          other_user_character.reload
          expect(response).to redirect_to(world_character_url(world, other_user_character))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch world_character_url(world, other_user_character), params: {character: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested character" do
        expect {
          delete world_character_url(world, other_user_character)
        }.to change(Character, :count).by(-1)
      end

      it "redirects to the characters list" do
        delete world_character_url(world, other_user_character)
        expect(response).to redirect_to(characters_user_url(other_user))
      end
    end
  end
end
