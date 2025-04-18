require "rails_helper"

RSpec.describe "/character_types", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world) }
  let!(:character_type) { create(:character_type) }

  let(:valid_attributes) {
    {
      name: Faker::Lorem.word
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  before do
    sign_in(user)
    start_world_builder_mode(world)
  end

  describe "GET /show" do
    it "renders a successful response" do
      get character_type_url(character_type)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_character_type_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new character_type" do
        expect {
          post character_types_url, params: {character_type: valid_attributes}
        }.to change(CharacterType, :count).by(1)
      end

      it "redirects to the created character_type" do
        post character_types_url, params: {character_type: valid_attributes}
        expect(response).to redirect_to(character_type_url(CharacterType.order(:created_at).last))
      end

      it "should set the correct world" do
        post character_types_url, params: {character_type: valid_attributes}
        expect(CharacterType.order(:created_at).last.world).to eq(world)
      end
    end

    context "with invalid parameters" do
      it "does not create a new character_type" do
        expect {
          post character_types_url, params: {character_type: invalid_attributes}
        }.to change(CharacterType, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post character_types_url, params: {character_type: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New name"}
      }

      it "updates the requested character_type" do
        patch character_type_url(character_type), params: {character_type: new_attributes}
        character_type.reload
        expect(character_type.name).to eq("New name")
      end

      it "redirects to the character_type" do
        patch character_type_url(character_type), params: {character_type: new_attributes}
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch character_type_url(character_type), params: {character_type: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested character_type" do
      expect {
        delete character_type_url(character_type)
      }.to change(CharacterType, :count).by(-1)
    end

    it "redirects to the character_types list" do
      delete character_type_url(character_type)
      expect(response).to redirect_to(root_url)
    end
  end
end
