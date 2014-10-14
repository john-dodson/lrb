json.array!(@service_to_vendors) do |service_to_vendor|
  json.extract! service_to_vendor, :id, :service_id, :vendor_id, :vendor_type_id
  json.url service_to_vendor_url(service_to_vendor, format: :json)
end
