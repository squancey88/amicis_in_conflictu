# frozen_string_literal: true

class MainHeaderComponent < ViewComponent::Base
  delegate :current_user, to: :helpers

  def render?
    !current_user.nil?
  end
end
