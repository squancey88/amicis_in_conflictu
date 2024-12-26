require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  let(:random_string) { Faker::Lorem.sentence }
  it "should convert simple text to rich" do
    rich_blocks = helper.simple_text_to_rich(random_string)
    first_block = JSON.parse(rich_blocks)["blocks"].first
    expect(first_block).to have_key("type")
    expect(first_block["data"]["text"]).to eq(random_string)
  end
end
