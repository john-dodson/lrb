json.array!(@florist_dates) do |florist_date|
  json.extract! florist_date, :id, :florist_id, :date, :service_id
  json.url florist_date_url(florist_date, format: :json)
end
