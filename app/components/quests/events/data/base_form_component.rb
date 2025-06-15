# frozen_string_literal: true

class Quests::Events::Data::BaseFormComponent < ViewComponent::Base
  erb_template <<~ERB
    <%= @form.hidden_field :id %>
    <%= @form.hidden_field :type %>
    <i class="bi bi-<%= @icon %> me-2"></i>
    <%= display_name %>
  ERB

  def initialize(form:, icon:)
    @form = form
    @icon = icon
  end

  def display_name
    return "New" if @form.object.new_record?
    @form.object
  end
end
