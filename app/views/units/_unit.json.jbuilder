json.extract! unit, :id, :name, :description, :cost, :stats, :created_at, :updated_at
json.url army_list_unit_url(@army_list, unit, format: :json)
