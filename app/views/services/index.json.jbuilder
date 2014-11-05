json.array!(@services) do |service|
  json.extract! service, :id, :service_type
  json.url service_url(service, format: :json)
end
