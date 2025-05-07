require "rails_helper"

RSpec.describe "/worlds", type: :request do
  let(:user) { create(:user) }
  let(:owner) { create(:user) }
  let!(:world) { create(:world, owner:) }

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

  context "as owner" do
    before do
      sign_in(owner)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get worlds_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get world_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /build" do
      it "renders a successful response" do
        get build_world_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_world_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_world_url(world)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new World" do
          expect {
            post worlds_url, params: {world: valid_attributes}
          }.to change(World, :count).by(1)
        end

        it "redirects to the created world" do
          post worlds_url, params: {world: valid_attributes}
          expect(response).to redirect_to(world_url(World.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new World" do
          expect {
            post worlds_url, params: {world: invalid_attributes}
          }.to change(World, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post worlds_url, params: {world: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {name: "New name"}
        }

        it "updates the requested world" do
          patch world_url(world), params: {world: new_attributes}
          world.reload
          expect(world.name).to eq("New name")
        end

        it "redirects to the world" do
          patch world_url(world), params: {world: new_attributes}
          world.reload
          expect(response).to redirect_to(world_url(world))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch world_url(world), params: {world: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested world" do
        expect {
          delete world_url(world)
        }.to change(World, :count).by(-1)
      end

      it "redirects to the worlds list" do
        delete world_url(world)
        expect(response).to redirect_to(worlds_url)
      end
    end
  end

  context "as non owner" do
    before do
      sign_in(user)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get worlds_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get world_url(world)
        expect(response).to be_successful
      end
    end

    describe "GET /build" do
      it "redirects to show" do
        get build_world_url(world)
        expect(response).to redirect_to(world)
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_world_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "redirects to show" do
        get edit_world_url(world)
        expect(response).to redirect_to(world)
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new World" do
          expect {
            post worlds_url, params: {world: valid_attributes}
          }.to change(World, :count).by(1)
        end

        it "redirects to the created world" do
          post worlds_url, params: {world: valid_attributes}
          expect(response).to redirect_to(world_url(World.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new World" do
          expect {
            post worlds_url, params: {world: invalid_attributes}
          }.to change(World, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post worlds_url, params: {world: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {name: "New name"}
        }

        it "updates the requested world" do
          patch world_url(world), params: {world: new_attributes}
          world.reload
          expect(world.name).to eq("New name")
        end

        it "redirects to the world" do
          patch world_url(world), params: {world: new_attributes}
          world.reload
          expect(response).to redirect_to(world_url(world))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch world_url(world), params: {world: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested world" do
        expect {
          delete world_url(world)
        }.to change(World, :count).by(-1)
      end

      it "redirects to the worlds list" do
        delete world_url(world)
        expect(response).to redirect_to(worlds_url)
      end
    end
  end
end
