class VenueToVendor < ActiveRecord::Base
  belongs_to :Venue
  belongs_to :Vendor
end
