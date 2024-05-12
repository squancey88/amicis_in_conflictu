# frozen_string_literal: true

class StandardLayoutBoxComponent < ViewComponent::Base
  renders_one :body
  renders_one :menu

  def initialize(title:, classes: [])
    @title = title
    @classes = classes
  end

  def box_classes
    (["bg-body-tertiary", "rounded-3", "p-3"] + @classes).join(" ")
  end
end
