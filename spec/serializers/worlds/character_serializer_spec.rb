require "rails_helper"

RSpec.describe Worlds::CharacterSerializer do
  let(:character) { create(:character) }

  it "serializes character attributes" do
    result = described_class.new(character).as_json

    expect(result["id"]).to eq(character.id)
    expect(result["created_at"]).to eq(character.created_at)
    expect(result["updated_at"]).to eq(character.updated_at)
    expect(result["given_name"]).to eq(character.given_name)
    expect(result["family_name"]).to eq(character.family_name)
  end
end
