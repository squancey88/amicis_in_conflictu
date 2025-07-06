require "rails_helper"

RSpec.describe "/location_types", type: :request do
  let(:owner) { create(:user) }
  let(:world) { create(:world, owner:) }
  let!(:location_type) { create(:location_type, world:) }

  let(:valid_attributes) {
    {name: Faker::Lorem.word}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  context "when current user is world owner" do
    before do
      sign_in(owner)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get world_location_types_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get world_location_type_url(world, location_type)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_world_location_type_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_world_location_type_url(world, location_type)
        expect(response).to redirect_to(world_location_type_url(world, location_type))
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new LocationType" do
          expect {
            post world_location_types_url(world), params: {location_type: valid_attributes}
          }.to change(LocationType, :count).by(1)
        end

        it "redirects to the created location_type" do
          post world_location_types_url(world), params: {location_type: valid_attributes}
          expect(response).to redirect_to(world_location_type_url(world, LocationType.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new LocationType" do
          expect {
            post world_location_types_url(world), params: {location_type: invalid_attributes}
          }.to change(LocationType, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post world_location_types_url(world), params: {location_type: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {name: "New name"}
        }

        it "updates the requested location_type" do
          patch world_location_type_url(world, location_type), params: {location_type: new_attributes}
          location_type.reload
          expect(location_type.name).to eq("New name")
        end

        it "redirects to the location_type" do
          patch world_location_type_url(world, location_type), params: {location_type: new_attributes}
          location_type.reload
          expect(response).to redirect_to(world_location_type_url(world, location_type))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch world_location_type_url(world, location_type), params: {location_type: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested location_type" do
        expect {
          delete world_location_type_url(world, location_type)
        }.to change(LocationType, :count).by(-1)
      end

      it "redirects to the location_types list" do
        delete world_location_type_url(world, location_type)
        expect(response).to redirect_to(world_url(world))
      end
    end
  end
end
