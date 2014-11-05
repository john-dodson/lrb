# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    vendor_types = VendorType.create([{ vendor_type: 'venue' }, { vendor_type: 'florist' }, { vendor_type: 'caterer' }, { vendor_type: 'photographer' }])
    services = Service.create([{ service_type: 'Wedding' }, { service_type: 'Private Party' }, { service_type: 'Corporate Event' }])
