require "rails_helper"

RSpec.describe "army_lists/new", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:army_list, ArmyList.new)
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
  end

  it "renders new army_list form" do
    render

    assert_select "form[action=?][method=?]", army_lists_path, "post" do
      assert_select "input[name=?]", "army_list[name]"

      assert_select "input[name=?]", "army_list[army_id]"
    end
  end
end
