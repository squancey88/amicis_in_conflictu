require "rails_helper"

RSpec.describe HasTextSection do
  context "text_sections" do
    let(:location) {
      create(:location,
        history: generate_text_section(blocks: [
          generate_paragraph_block(text: "I am some text"),
          generate_unordered_list_block(items: [
            generate_list_item(content: "Item 1"),
            generate_list_item(content: "Item 2", items: [
              generate_list_item(content: "Item 2.1")
            ])
          ]),
          generate_ordered_list_block(items: [
            generate_list_item(content: "First"),
            generate_list_item(content: "Second", items: [
              generate_list_item(content: "Second first")
            ])
          ])
        ]))
    }

    context "#history_plain_text" do
      let(:text) { location.history_plain_text }

      it "should include paragraph" do
        expect(text).to match(/I am some text/)
      end

      it "should include unordered bullet points" do
        expect(text).to match(/Item 1\nItem 2\nItem 2.1\n/)
      end

      it "should include ordered bullet points" do
        expect(text).to match(/1: First\n/)
        expect(text).to match(/2: Second\n2.1: Second first\n/)
      end
    end
  end
end
