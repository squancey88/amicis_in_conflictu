# frozen_string_literal: true

require "rails_helper"

RSpec.describe EquipmentAttachments::ListComponent, type: :component do
  let(:army_list) { create(:army_list) }
  let!(:equipment_attachment) { create(:equipment_attachment, attached_to: army_list) }

  before do
    render_inline(described_class.new(army_list:))
  end

  it "should render the attachment link" do
    expect(page).to have_css("form[action='/army_lists/#{army_list.id}/attach_equipment']")
  end
end
