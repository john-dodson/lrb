json.array!(@venue_to_vendors) do |venue_to_vendor|
  json.extract! venue_to_vendor, :id, :venue_id, :vendor_id, :vendor_type_id
  json.url venue_to_vendor_url(venue_to_vendor, format: :json)
end
