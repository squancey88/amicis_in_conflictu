require "rails_helper"

RSpec.describe Character, type: :model do
  context "validations" do
    it { should validate_presence_of(:given_name) }
  end

  context "attributes" do
    it { should belong_to(:character_type) }
  end

  context "#text sections" do
    let(:character) {
      create(:character, history: generate_text_section(blocks: [
        generate_paragraph_block(text: "I am some text <strong>with some html</strong>")
      ]))
    }

    it "returns cleaned text" do
      expect(character.history_plain_text).to eq("I am some text with some html")
    end
  end
end
