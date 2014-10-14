json.array!(@caterer_dates) do |caterer_date|
  json.extract! caterer_date, :id, :caterer_id, :date, :service_id
  json.url caterer_date_url(caterer_date, format: :json)
end
