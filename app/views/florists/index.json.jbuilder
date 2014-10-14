json.array!(@florists) do |florist|
  json.extract! florist, :id, :name
  json.url florist_url(florist, format: :json)
end
