json.extract! army_list, :id, :name, :details, :army_id, :cost, :created_at, :updated_at
json.url army_army_list_url(@army, army_list, format: :json)
