json.array!(@photographer_dates) do |photographer_date|
  json.extract! photographer_date, :id, :photographer_id, :date, :service_id
  json.url photographer_date_url(photographer_date, format: :json)
end
