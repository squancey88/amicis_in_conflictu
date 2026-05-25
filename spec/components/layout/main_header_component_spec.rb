require "rails_helper"

RSpec.describe Layout::MainHeaderComponent, type: :component do
  let(:user) { create(:user) }

  context "when logged in" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
      render_inline(described_class.new)
    end

    it "should render the editor div" do
      expect(page).to have_css("[data-react-component='HeaderMenu']")
    end

    it "passes correct props to React" do
      doc = Nokogiri::HTML(rendered_content)
      node = doc.at_css("[data-react-component='HeaderMenu']")
      props = JSON.parse(node["data-props"])

      expect(props).to include(
        "logoHref" => "/"
      )
    end
  end

  context "when not logged in" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(nil)
      render_inline(described_class.new)
    end

    it "should not render when no current_user" do
      expect(page).to have_no_css("[data-react-component='HeaderMenu']")
    end
  end
end
