class WorldSerializer < BaseSerializer
  private

  def serialize_single(world)
    attributes = {}

    attributes[:id] = world.id if include_attribute?(:id)
    attributes[:name] = world.name if include_attribute?(:name)
    attributes[:blurb] = world.blurb_plain_text if include_attribute?(:blurb)

    attributes
  end
end
