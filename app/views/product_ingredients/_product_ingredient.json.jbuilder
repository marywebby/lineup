json.extract! product_ingredient, :id, :product_id, :ingredient_id, :created_at, :updated_at
json.url product_ingredient_url(product_ingredient, format: :json)
