class Venue < ActiveRecord::Base
  has_many :VendorDates
  has_many :VenueToVendors, dependent: :destroy
  belongs_to :Vendor
end
