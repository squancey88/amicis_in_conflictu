RSpec.shared_examples "world visibility controller" do |path|
  let(:base_path) { root_url + path }
  let(:show_path) { base_path + "/#{model.id}" }
  let(:new_path) { base_path + "/new" }
  let(:edit_path) { show_path + "/edit" }
  let(:klass) { path.classify.constantize }

  context "as owner" do
    before do
      sign_in(owner)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get base_path
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get show_path
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_path
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_path
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        let(:valid_params) {
          {path.singularize => valid_attributes}
        }

        it "creates a new record" do
          expect {
            post base_path, params: valid_params
          }.to change(klass, :count).by(1)
        end

        it "redirects to the created record" do
          post base_path, params: valid_params
          expect(response).to redirect_to(base_path + "/" + klass.order(:created_at).last.id)
        end

        it "should set the correct world" do
          post base_path, params: valid_params
          expect(klass.order(:created_at).last.world).to eq(world)
        end
      end

      context "with invalid parameters" do
        let(:invalid_params) {
          {path.singularize => invalid_attributes}
        }

        it "does not create a new record" do
          expect {
            post base_path, params: invalid_params
          }.to change(klass, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post base_path, params: invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      let(:update_path) { base_path + "/#{model.id}" }
      let(:update_params) {
        {path.singularize => new_attributes}
      }
      let(:invalid_params) {
        {path.singularize => invalid_attributes}
      }

      context "with valid parameters" do
        it "updates the requested record" do
          patch update_path, params: update_params
          model.reload
          new_attributes.each do |key, value|
            expect(model.send(key)).to eq(value)
          end
        end

        it "redirec to record" do
          patch update_path, params: update_params
          expect(response).to redirect_to(show_path)
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          patch update_path, params: invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested record" do
        model
        expect {
          delete show_path
        }.to change(klass, :count).by(-1)
      end

      it "redirects to the index" do
        delete show_path
        expect(response).to redirect_to(base_path)
      end
    end
  end
end
