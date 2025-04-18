require "rails_helper"
require "support/shared_examples/simple_model_controller"

RSpec.describe "/character_species_types", type: :request do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }
  let!(:model) { create(:character_species_type, world:) }

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
  let(:new_attributes) {
    {name: "New name"}
  }

  before do
    sign_in(user)
    start_world_builder_mode(world)
  end

  it_should_behave_like "simple model controller", "character_species_types"
end
