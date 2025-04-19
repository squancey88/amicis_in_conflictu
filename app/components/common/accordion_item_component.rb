# frozen_string_literal: true

class Common::AccordionItemComponent < ViewComponent::Base
  renders_one :header
  renders_one :body

  def initialize
    @id = SecureRandom.hex(6)
  end
end
