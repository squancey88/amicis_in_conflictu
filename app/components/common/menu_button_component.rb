# frozen_string_literal: true

class Common::MenuButtonComponent < ViewComponent::Base
  def initialize(menu_options:, additional_classes: [], icon: "bi-gear-fill")
    @menu_options = menu_options
    @icon = icon
    @additional_classes = additional_classes
  end

  def menu_classes
    ["dropdown"] + @additional_classes
  end

  def icon_classes
    ["bi", @icon]
  end
end
