json.array!(@venue_dates) do |venue_date|
  json.extract! venue_date, :id, :venue_id, :date, :service_id
  json.title "#{Venue.find(venue_date.venue_id).name}: #{Service.find(venue_date.service_id).service_type}"
  json.venue Venue.find(venue_date.venue_id).name
  json.service Service.find(venue_date.service_id).service_type
  json.start venue_date.date
  json.end venue_date.date
  json.url venue_date_url(venue_date, format: :html)
end
