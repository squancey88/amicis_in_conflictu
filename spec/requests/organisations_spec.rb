require "rails_helper"

RSpec.describe "/organisations", type: :request do
  let(:owner) { create(:user) }
  let!(:world) { create(:world, owner:) }
  let!(:organisation_type) { create(:organisation_type, world:) }
  let!(:organisation) { create(:organisation, world:, organisation_type:) }

  let(:valid_attributes) {
    {
      name: "Test organisation",
      organisation_type_id: organisation_type.id
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  before do
    sign_in owner
  end

  describe "GET /index" do
    it "renders a successful response" do
      get world_organisations_url(world)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get world_organisation_url(world, organisation)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_world_organisation_url(world)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_world_organisation_url(world, organisation)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Organisation" do
        expect {
          post world_organisations_url(world), params: {organisation: valid_attributes}
        }.to change(Organisation, :count).by(1)
      end

      it "redirects to the created organisation" do
        post world_organisations_url(world), params: {organisation: valid_attributes}
        expect(response).to redirect_to(world_organisation_url(world, Organisation.order(:created_at).last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Organisation" do
        expect {
          post world_organisations_url(world), params: {organisation: invalid_attributes}
        }.to change(Organisation, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post world_organisations_url(world), params: {organisation: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New Name"}
      }

      it "updates the requested organisation" do
        patch world_organisation_url(world, organisation), params: {organisation: new_attributes}
        organisation.reload
        expect(organisation.name).to eq("New Name")
      end

      it "redirects to the organisation" do
        patch world_organisation_url(world, organisation), params: {organisation: new_attributes}
        organisation.reload
        expect(response).to redirect_to(world_organisation_url(world, organisation))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch world_organisation_url(world, organisation), params: {organisation: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested organisation" do
      expect {
        delete world_organisation_url(world, organisation)
      }.to change(Organisation, :count).by(-1)
    end

    it "redirects to the organisations list" do
      delete world_organisation_url(world, organisation)
      expect(response).to redirect_to(world_url(world))
    end
  end
end
