json.array!(@photographers) do |photographer|
  json.extract! photographer, :id, :name
  json.url photographer_url(photographer, format: :json)
end
