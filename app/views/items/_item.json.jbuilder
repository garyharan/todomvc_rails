json.extract! item, :id, :body, :completed_at, :created_at, :updated_at
json.url item_url(item, format: :json)
