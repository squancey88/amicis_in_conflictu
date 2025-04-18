class Common::TabsSectionComponentPreview < ViewComponent::Preview
  def default
    render(Common::TabsSectionComponent.new) do |comp|
      comp.with_tab(label: "Test") do
        tag.div do
          content_tag(:span, "Test")
        end
      end
      comp.with_tab(label: "Other") do
        tag.div do
          content_tag(:span, "Other content")
        end
      end
    end
  end
end
