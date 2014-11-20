# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    vendor_types = VendorType.create([{ vendor_type: 'venue' }, { vendor_type: 'florist' }, { vendor_type: 'caterer' }, { vendor_type: 'photographer' }])
    services = Service.create([{ service_type: 'All' },{ service_type: 'Wedding' }, { service_type: 'Private Party' }, { service_type: 'Corporate Event' }])
    vendors = Vendor.create([{ vendor_type_id: 1 }, { vendor_type_id: 1 }, { vendor_type_id: 1 }, { vendor_type_id: 1 }, { vendor_type_id: 1 }, { vendor_type_id: 2 }, { vendor_type_id: 2 }, { vendor_type_id: 2 }, { vendor_type_id: 2 }, { vendor_type_id: 2 }, { vendor_type_id: 3 }, { vendor_type_id: 3 }, { vendor_type_id: 3 }, { vendor_type_id: 3 }, { vendor_type_id: 3 }, { vendor_type_id: 4 }, { vendor_type_id: 4 }, { vendor_type_id: 4 }, { vendor_type_id: 4 }, { vendor_type_id: 4 }])
    venues = Venue.create([{name: "Venue 1", vendor_id: 1}, {name: "Venue 2", vendor_id: 2}, {name: "Venue 3", vendor_id: 3}, {name: "Venue 4", vendor_id: 4}, {name: "Venue 5", vendor_id: 5}])
    florists = Florist.create([{name: "Florist 1", vendor_id: 6}, {name: "Florist 2", vendor_id: 7}, {name: "Florist 3", vendor_id: 8}, {name: "Florist 4", vendor_id: 9}, {name: "Florist 5", vendor_id: 10}])
    caterers = Caterer.create([{name: "Caterer 1", vendor_id: 11}, {name: "Caterer 2", vendor_id: 12}, {name: "Caterer 3", vendor_id: 13}, {name: "Caterer 4", vendor_id: 14}, {name: "Caterer 5", vendor_id: 15}])
    photographers = Photographer.create([{name: "Photographer 1", vendor_id: 16}, {name: "Photographer 2", vendor_id: 17}, {name: "Photographer 3", vendor_id: 18}, {name: "Photographer 4", vendor_id: 19}, {name: "Photographer 5", vendor_id: 20}])
    v2v1 = VenueToVendor.create([{venue_id: 1, vendor_id: 7}, {venue_id: 1, vendor_id: 8}, {venue_id: 1, vendor_id: 9}, {venue_id: 1, vendor_id: 10}, {venue_id: 1, vendor_id: 11}, {venue_id: 1, vendor_id: 12}, {venue_id: 1, vendor_id: 13}, {venue_id: 1, vendor_id: 14}, {venue_id: 1, vendor_id: 15}, {venue_id: 1, vendor_id: 6}, {venue_id: 1, vendor_id: 16}, {venue_id: 1, vendor_id: 17}, {venue_id: 1, vendor_id: 18}, {venue_id: 1, vendor_id: 19}, {venue_id: 1, vendor_id: 20}])
    v2v2 = VenueToVendor.create([{venue_id: 2, vendor_id: 8}, {venue_id: 2, vendor_id: 10}, {venue_id: 2, vendor_id: 12}, {venue_id: 2, vendor_id: 14}, {venue_id: 2, vendor_id: 6}, {venue_id: 2, vendor_id: 16}, {venue_id: 2, vendor_id: 18}, {venue_id: 2, vendor_id: 20}])
    v2v3 = VenueToVendor.create([ {venue_id: 2, vendor_id: 10}, {venue_id: 2, vendor_id: 14}, {venue_id: 2, vendor_id: 6}, {venue_id: 2, vendor_id: 18}, {venue_id: 2, vendor_id: 20}])
    vd = VendorDate.create([{vendor_id: 1, service_id: 1, date: Date.new(2014,12,1)}, {vendor_id: 6, service_id: 1, date: Date.new(2014,12,1)}, {vendor_id: 12, service_id: 3, date: Date.new(2014,12,1)}, {vendor_id: 13, service_id: 1, date: Date.new(2014,12,1)}, {vendor_id: 16, service_id: 1, date: Date.new(2014,12,1)}, {vendor_id: 1, service_id: 2, date: Date.new(2014,12,2)}, {vendor_id: 1, service_id: 3, date: Date.new(2014,12,3)}, {vendor_id: 1, service_id: 4, date: Date.new(2014,12,4)}])
