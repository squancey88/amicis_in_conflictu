require "rails_helper"

RSpec.describe "/equipment", type: :request do
  let(:game_system) { create(:wargame) }
  let(:user) { create(:user) }

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
      Equipment.create! valid_attributes
      get equipment_index_url(game_system_id: game_system.id)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      equipment = Equipment.create! valid_attributes
      get equipment_url(equipment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_equipment_url(game_system_id: game_system.id)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      equipment = Equipment.create! valid_attributes
      get edit_equipment_url(equipment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Equipment" do
        expect {
          post equipment_index_url, params: {equipment: valid_attributes}
        }.to change(Equipment, :count).by(1)
      end

      it "redirects to the created equipment" do
        post equipment_index_url, params: {equipment: valid_attributes}
        expect(response).to redirect_to(game_systems_wargame_url(game_system))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Equipment" do
        expect {
          post equipment_index_url, params: {equipment: invalid_attributes}
        }.to change(Equipment, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post equipment_index_url, params: {equipment: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New name"}
      }

      it "updates the requested equipment" do
        equipment = Equipment.create! valid_attributes
        patch equipment_url(equipment), params: {equipment: new_attributes}
        equipment.reload
        expect(equipment.name).to eq "New name"
      end

      it "redirects to the equipment" do
        equipment = Equipment.create! valid_attributes
        patch equipment_url(equipment), params: {equipment: new_attributes}
        equipment.reload
        expect(response).to redirect_to(game_systems_wargame_url(game_system))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        equipment = Equipment.create! valid_attributes
        patch equipment_url(equipment), params: {equipment: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested equipment" do
      equipment = Equipment.create! valid_attributes
      expect {
        delete equipment_url(equipment)
      }.to change(Equipment, :count).by(-1)
    end

    it "redirects to the equipment list" do
      equipment = Equipment.create! valid_attributes
      delete equipment_url(equipment)
      expect(response).to redirect_to(equipment_index_url)
    end
  end
end
