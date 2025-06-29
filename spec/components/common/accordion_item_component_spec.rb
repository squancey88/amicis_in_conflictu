# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::AccordionItemComponent, type: :component do
  before do
    render_inline(described_class.new) do |component|
      component.with_header do
        "Testing"
      end
      component.with_body do
        "I am the body"
      end
    end
  end

  it "renders header" do
    expect(page).to have_css("button.accordion-button", text: "Testing")
  end

  it "renders body" do
    expect(page).to have_css("div.accordion-body", text: "I am the body")
  end
end
