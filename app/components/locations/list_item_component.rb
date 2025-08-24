# frozen_string_literal: true

class Locations::ListItemComponent < Common::ListItemComponent
  def initialize(location:)
    super(record: location)
    @location = location
  end

  def display_name
    location.name
  end

  def subtext
    return nil if location.located_in.nil?
    breadcrumbs(location.located_in).join(" > ")
  end

  def link
    [location.world, location]
  end

  def breadcrumbs(current_location, list = [])
    list.insert(0, current_location.name)
    breadcrumbs(current_location.located_in, list) if current_location.located_in.presence
    list
  end

  private

  attr_reader :location
end
