require "rails_helper"

RSpec.describe "/locations", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }

  let(:location_type) { create(:location_type, world:) }
  let!(:location) { create(:location, world:, location_type:) }

  let(:valid_attributes) {
    {
      name: Faker::Lorem.word,
      location_type_id: location_type.id
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  context "current user is world owner" do
    before do
      sign_in(user)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get world_locations_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get world_location_url(world, location)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_world_location_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_world_location_url(world, location)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Location" do
          expect {
            post world_locations_url(world), params: {location: valid_attributes}
          }.to change(Location, :count).by(1)
        end

        it "redirects to the created location" do
          post world_locations_url(world), params: {location: valid_attributes}
          expect(response).to redirect_to(world_location_url(world, Location.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Location" do
          expect {
            post world_locations_url(world), params: {location: invalid_attributes}
          }.to change(Location, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post world_locations_url(world), params: {location: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {name: "New Name"}
        }

        it "updates the requested location" do
          patch world_location_url(world, location), params: {location: new_attributes}
          location.reload
          expect(location.name).to eq("New Name")
        end

        it "redirects to the location" do
          patch world_location_url(world, location), params: {location: new_attributes}
          location.reload
          expect(response).to redirect_to(world_location_url(world, location))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch world_location_url(world, location), params: {location: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested location" do
        expect {
          delete world_location_url(world, location)
        }.to change(Location, :count).by(-1)
      end

      it "redirects to the world" do
        delete world_location_url(world, location)
        expect(response).to redirect_to(world_url(world))
      end
    end
  end
end
