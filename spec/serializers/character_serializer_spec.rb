require "rails_helper"

RSpec.describe CharacterSerializer do
  let(:character) { create(:character) }

  it "serializes character attributes" do
    result = described_class.new(character).serialize

    expect(result[:id]).to eq(character.id)
    expect(result[:created_at]).to eq(character.created_at.to_s)
    expect(result[:updated_at]).to eq(character.updated_at.to_s)
    expect(result[:given_name]).to eq(character.given_name)
    expect(result[:family_name]).to eq(character.family_name)
  end

  it "respects only option" do
    result = described_class.new(character, only: [:given_name], exclude_timestamps: true).serialize

    expect(result.keys).to contain_exactly(:id, :given_name)
  end
end
