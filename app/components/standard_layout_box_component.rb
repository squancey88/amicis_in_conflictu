# frozen_string_literal: true

class StandardLayoutBoxComponent < ViewComponent::Base
  renders_one :body
  renders_one :menu

  def initialize(title: nil, classes: [])
    @title = title
    @classes = classes
  end

  def box_classes
    (["card", "text-bg-light"] + @classes).join(" ")
  end
end
