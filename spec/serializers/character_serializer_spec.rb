require "rails_helper"

RSpec.describe CharacterSerializer do
  let(:character) { create(:character) }

  it "serializes character attributes" do
    result = described_class.new(character).serialize

    expect(result[:id]).to eq(character.id)
    expect(result[:given_name]).to eq(character.given_name)
    expect(result[:family_name]).to eq(character.family_name)
  end

  it "respects only option" do
    result = described_class.new(character, only: [:id, :given_name]).serialize

    expect(result.keys).to contain_exactly(:id, :given_name)
  end
end
