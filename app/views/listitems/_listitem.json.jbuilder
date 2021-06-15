json.extract! listitem, :id, :item_name, :item_count, :item_description, :created_at, :updated_at
json.url listitem_url(listitem, format: :json)
