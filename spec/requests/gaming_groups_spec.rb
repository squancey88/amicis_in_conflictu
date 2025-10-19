require "rails_helper"

RSpec.describe "/gaming_groups", type: :request do
  let(:gaming_group) { create(:gaming_group) }
  let(:owner) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: true)
    user
  }
  let(:member) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: false)
    user
  }
  let(:non_member) { create(:user) }

  let(:valid_attributes) {
    {
      name: "test group"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  let(:new_attributes) {
    {
      name: "Other name"
    }
  }

  describe "non member user" do
    before do
      sign_in(non_member)
    end

    describe "GET /show" do
      it "should redirect to home for non member user" do
        get gaming_group_url(gaming_group)
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe "as standard user" do
    before do
      sign_in(member)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get gaming_groups_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get gaming_group_url(gaming_group)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_gaming_group_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "should redirect to show" do
        get edit_gaming_group_url(gaming_group)
        expect(response).to redirect_to(gaming_group)
      end
    end
    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new GamingGroup" do
          expect {
            post gaming_groups_url, params: {gaming_group: valid_attributes}
          }.to change(GamingGroup, :count).by(1)
        end

        it "redirects to the created gaming_group" do
          post gaming_groups_url, params: {gaming_group: valid_attributes}
          expect(response).to redirect_to(gaming_group_url(GamingGroup.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new GamingGroup" do
          expect {
            post gaming_groups_url, params: {gaming_group: invalid_attributes}
          }.to change(GamingGroup, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post gaming_groups_url, params: {gaming_group: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      it "should redirect to show" do
        patch gaming_group_url(gaming_group), params: {gaming_group: new_attributes}
        gaming_group.reload
        expect(response).to redirect_to(gaming_group_url(gaming_group))
      end
    end

    describe "DELETE /destroy" do
      it "should not destroy record" do
        expect {
          delete gaming_group_url(gaming_group)
        }.to change(GamingGroup, :count).by(0)
      end
    end

    context "user management" do
      describe "POST /update_membership" do
        it "should redirect to show" do
          post update_membership_gaming_group_url(gaming_group), params: {user_id: owner.id}
          expect(response).to redirect_to(gaming_group_url(gaming_group))
        end
      end

      describe "POST /remove_user" do
        it "should redirect to show" do
          post remove_user_gaming_group_url(gaming_group), params: {user_id: owner.id}
          expect(response).to redirect_to(gaming_group_url(gaming_group))
        end
      end

      describe "POST /invite_user" do
        let(:email) { Faker::Internet.email }
        let(:existing_user) { create(:user) }

        it "should redirect to show" do
          post invite_user_gaming_group_url(gaming_group), params: {email:, owner: false}
          expect(response).to redirect_to(gaming_group_url(gaming_group))
        end
      end
    end
  end

  context "as owner user" do
    before do
      sign_in(owner)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get gaming_groups_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get gaming_group_url(gaming_group)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_gaming_group_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_gaming_group_url(gaming_group)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new GamingGroup" do
          expect {
            post gaming_groups_url, params: {gaming_group: valid_attributes}
          }.to change(GamingGroup, :count).by(1)
        end

        it "redirects to the created gaming_group" do
          post gaming_groups_url, params: {gaming_group: valid_attributes}
          expect(response).to redirect_to(gaming_group_url(GamingGroup.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new GamingGroup" do
          expect {
            post gaming_groups_url, params: {gaming_group: invalid_attributes}
          }.to change(GamingGroup, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post gaming_groups_url, params: {gaming_group: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        it "updates the requested gaming_group" do
          patch gaming_group_url(gaming_group), params: {gaming_group: new_attributes}
          gaming_group.reload
          expect(gaming_group.name).to eq("Other name")
        end

        it "redirects to the gaming_group" do
          patch gaming_group_url(gaming_group), params: {gaming_group: new_attributes}
          gaming_group.reload
          expect(response).to redirect_to(gaming_group_url(gaming_group))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch gaming_group_url(gaming_group), params: {gaming_group: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested gaming_group" do
        expect {
          delete gaming_group_url(gaming_group)
        }.to change(GamingGroup, :count).by(-1)
      end

      it "redirects to the gaming_groups list" do
        delete gaming_group_url(gaming_group)
        expect(response).to redirect_to(gaming_groups_url)
      end
    end

    context "users management" do
      describe "POST /update_membership" do
        it "should demote an owner" do
          post update_membership_gaming_group_url(gaming_group), params: {user_id: owner.id}
          gaming_group.reload
          expect(gaming_group.is_owner?(owner)).to be false
        end

        it "should promote a member" do
          post update_membership_gaming_group_url(gaming_group), params: {user_id: member.id}
          gaming_group.reload
          expect(gaming_group.is_owner?(member)).to be true
        end
      end

      describe "POST /remove_user" do
        it "should remove an owner" do
          post remove_user_gaming_group_url(gaming_group), params: {user_id: owner.id}
          gaming_group.reload
          expect(gaming_group.users).not_to include(owner)
        end

        it "should promote a member" do
          post remove_user_gaming_group_url(gaming_group), params: {user_id: member.id}
          gaming_group.reload
          expect(gaming_group.users).not_to include(member)
        end
      end

      describe "POST /invite_user" do
        let(:email) { Faker::Internet.email }
        let(:existing_user) { create(:user) }

        it "should invite new user and add as member" do
          post invite_user_gaming_group_url(gaming_group), params: {email:, owner: false}
          expect(gaming_group.members).to include(User.find_by(email:))
        end

        it "should invite new user and add as owner" do
          post invite_user_gaming_group_url(gaming_group), params: {email:, owner: true}
          expect(gaming_group.owners).to include(User.find_by(email:))
        end

        it "should invite exising user and add as member" do
          post invite_user_gaming_group_url(gaming_group), params: {email: existing_user.email, owner: false}
          expect(gaming_group.members).to include(existing_user)
        end

        it "should invite exising user and add as owner" do
          post invite_user_gaming_group_url(gaming_group), params: {email: existing_user.email, owner: true}
          expect(gaming_group.owners).to include(existing_user)
        end
      end
    end
  end
end
