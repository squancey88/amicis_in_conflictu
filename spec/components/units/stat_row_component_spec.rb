# frozen_string_literal: true

require "rails_helper"

RSpec.describe Units::StatRowComponent, type: :component do
  let(:unit) { create(:unit) }
  let!(:unit_stat) { create(:unit_stat, unit:) }
  let(:standard_stat) { create(:unit_stat_definition, stat_type: :standard_stat) }
  let(:save_stat) { create(:unit_stat_definition, stat_type: :save_stat) }
  let(:distance_stat) { create(:unit_stat_definition, stat_type: :distance_stat) }

  before do
    @instance = described_class.new(unit_stats: unit.unit_stats)
    render_inline(@instance)
  end

  it "should render" do
    expect(page).to have_css(".stat-row")
  end

  it "standard stat should have no flourish" do
    expect(@instance.stat_flourish(standard_stat)).to be ""
  end

  it "save stat should have no flourish" do
    expect(@instance.stat_flourish(save_stat)).to be "+"
  end

  it "distance stat should have no flourish" do
    expect(@instance.stat_flourish(distance_stat)).to be "\""
  end
end
