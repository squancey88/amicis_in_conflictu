require "rails_helper"

RSpec.describe "/articles", type: :request do
  let(:valid_attributes) {
    {
      world_id: world.id,
      title: Faker::Lorem.sentence
    }
  }

  let(:invalid_attributes) {
    {
      world_id: nil,
      title: nil
    }
  }

  let(:owner) { create(:user) }
  let(:player) { create(:user) }

  let(:world) { create(:world, owner:) }

  let!(:articles) { create(:article, world:) }

  context "as owner" do
    before do
      sign_in(owner)
    end

    describe "GET /index" do
      it "renders a successful response" do
        get articles_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        article = Article.create! valid_attributes
        get article_url(article)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_article_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        article = Article.create! valid_attributes
        get edit_article_url(article)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Article" do
          expect {
            post articles_url, params: {article: valid_attributes}
          }.to change(Article, :count).by(1)
        end

        it "redirects to the created article" do
          post articles_url, params: {article: valid_attributes}
          expect(response).to redirect_to(article_url(Article.order(:created_at).last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Article" do
          expect {
            post articles_url, params: {article: invalid_attributes}
          }.to change(Article, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post articles_url, params: {article: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {title: "New title"}
        }

        it "updates the requested article" do
          article = Article.create! valid_attributes
          patch article_url(article), params: {article: new_attributes}
          article.reload
          expect(article.title).to eq("New title")
        end

        it "redirects to the article" do
          article = Article.create! valid_attributes
          patch article_url(article), params: {article: new_attributes}
          article.reload
          expect(response).to redirect_to(article_url(article))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          article = Article.create! valid_attributes
          patch article_url(article), params: {article: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested article" do
        article = Article.create! valid_attributes
        expect {
          delete article_url(article)
        }.to change(Article, :count).by(-1)
      end

      it "redirects to the articles list" do
        article = Article.create! valid_attributes
        delete article_url(article)
        expect(response).to redirect_to(articles_url)
      end
    end
  end
end
