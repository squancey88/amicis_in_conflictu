json.extract! gaming_group, :id, :name, :created_at, :updated_at

json.members gaming_group.members, :id, :display_name, :email
json.owners gaming_group.owners, :id, :display_name, :email

json.url gaming_group_url(gaming_group, format: :json)
