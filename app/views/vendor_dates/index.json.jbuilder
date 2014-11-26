json.array!(@vendor_dates) do |vendor_date|
  json.extract! vendor_date, :id, :vendor_id, :date, :service_id
  json.url vendor_date_url(vendor_date, format: :html)
end
