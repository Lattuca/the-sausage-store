json.array!(@sausages) do |sausage|
  json.extract! sausage, :id, :name, :description, :qty, :fresh, :calories, :price
  json.url sausage_url(sausage, format: :json)
end
