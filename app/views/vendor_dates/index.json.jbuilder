json.array!(@vendor_dates) do |vendor_date|
  json.extract! vendor_date, :id, :vendor_id, :date, :service_id
  json.title "#{Venue.find(vendor_date.vendor_id).name}: #{Service.find(vendor_date.service_id).service_type}"
  json.venue Venue.find(vendor_date.vendor_id).name
  json.service Service.find(vendor_date.service_id).service_type
  json.start vendor_date.date
  json.end vendor_date.date
  json.url vendor_date_url(vendor_date, format: :html)
end
