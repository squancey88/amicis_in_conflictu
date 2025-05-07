require "rails_helper"
require "support/shared_examples/world_visibility_controller"

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

  let(:new_attributes) {
    {
      title: "New title"
    }
  }

  let(:owner) { create(:user) }
  let(:player) { create(:user) }

  let(:world) { create(:world, owner:) }

  let(:model) { create(:article, world:) }

  it_should_behave_like "world visibility controller", "articles"
end
