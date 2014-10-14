json.array!(@caterers) do |caterer|
  json.extract! caterer, :id, :name
  json.url caterer_url(caterer, format: :json)
end
