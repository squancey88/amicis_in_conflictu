class GamingSessionSerializer
  include Alba::Resource
  include Rails.application.routes.url_helpers

  attributes :id, :created_at, :updated_at, :start_time

  attribute :pretty_time do |resource|
    I18n.l resource.start_time
  end

  attribute :edit_path do |resource|
    edit_gaming_group_gaming_session_path(resource, gaming_group_id: resource.gaming_group.id)
  end
  attribute :show_path do |resource|
    gaming_group_gaming_session_path(resource, gaming_group_id: resource.gaming_group.id)
  end
end
