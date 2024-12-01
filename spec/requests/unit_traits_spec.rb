require "rails_helper"

RSpec.describe "/unit_traits", type: :request do
  let(:user) { create(:user) }
  let(:game_system) { create(:wargame) }
  let(:valid_attributes) {
    {
      name: Faker::Lorem.word,
      game_system_id: game_system.id
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      game_system_id: game_system.id
    }
  }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      UnitTrait.create! valid_attributes
      get unit_traits_url(game_system_id: game_system.id)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      unit_trait = UnitTrait.create! valid_attributes
      get unit_trait_url(unit_trait)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_unit_trait_url(game_system_id: game_system.id)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      unit_trait = UnitTrait.create! valid_attributes
      get edit_unit_trait_url(unit_trait)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UnitTrait" do
        expect {
          post unit_traits_url, params: {unit_trait: valid_attributes}
        }.to change(UnitTrait, :count).by(1)
      end

      it "redirects to the created unit_trait" do
        post unit_traits_url, params: {unit_trait: valid_attributes}
        expect(response).to redirect_to(game_systems_wargame_url(game_system))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UnitTrait" do
        expect {
          post unit_traits_url, params: {unit_trait: invalid_attributes}
        }.to change(UnitTrait, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post unit_traits_url, params: {unit_trait: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New name"}
      }

      it "updates the requested unit_trait" do
        unit_trait = UnitTrait.create! valid_attributes
        patch unit_trait_url(unit_trait), params: {unit_trait: new_attributes}
        unit_trait.reload
        expect(unit_trait.name).to eq "New name"
      end

      it "redirects to the unit_trait" do
        unit_trait = UnitTrait.create! valid_attributes
        patch unit_trait_url(unit_trait), params: {unit_trait: new_attributes}
        unit_trait.reload
        expect(response).to redirect_to(game_systems_wargame_url(game_system))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        unit_trait = UnitTrait.create! valid_attributes
        patch unit_trait_url(unit_trait), params: {unit_trait: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested unit_trait" do
      unit_trait = UnitTrait.create! valid_attributes
      expect {
        delete unit_trait_url(unit_trait)
      }.to change(UnitTrait, :count).by(-1)
    end

    it "redirects to the unit_traits list" do
      unit_trait = UnitTrait.create! valid_attributes
      delete unit_trait_url(unit_trait)
      expect(response).to redirect_to(unit_traits_url)
    end
  end
end
