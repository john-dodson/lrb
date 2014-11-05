json.array!(@venue_dates) do |venue_date|
  json.extract! venue_date, :id, :vendor_id, :date, :service_id
  json.start venue_date.date
  json.end venue_date.date
  json.url venue_date_url(venue_date, format: :html)
end
