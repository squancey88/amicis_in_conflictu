require "rails_helper"

RSpec.describe "army_lists/edit", type: :view do
  let(:army) { create(:army) }
  let(:army_list) { create(:army_list, army:) }
  let(:user) { create(:user) }

  before(:each) do
    assign(:army_list, army_list)
    assign(:army, army)
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
  end

  it "renders the edit army_list form" do
    render

    assert_select "form[action=?][method=?]", army_list_path(army_list), "post" do
      assert_select "input[name=?]", "army_list[name]"

      assert_select "input[name=?]", "army_list[army_id]"
    end
  end
end
