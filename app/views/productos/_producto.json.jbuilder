json.extract! producto, :id, :name, :price, :description, :created_at, :updated_at
json.url producto_url(producto, format: :json)
