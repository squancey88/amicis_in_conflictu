module Api
  module Worlds
    class ArticlesController < BaseController
      before_action :set_world

      def index
        pagy, records = pagy(@world.articles)
        render json: {
          records: ::Worlds::ArticleSerializer.new(records).serializable_hash,
          pagination: pagy.data_hash
        }
      end

      def show
        article = @world.articles.find(params[:id])
        render ::Worlds::ArticleSerializer.new(article).serialize
      end

      private

      def set_world
        @world = World.find(params[:world_id])
      end
    end
  end
end
