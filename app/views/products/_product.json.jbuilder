json.extract! product, :id, :name, :category_id, :active, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
