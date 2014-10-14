class Venue < ActiveRecord::Base
  has_many :VenueDates, dependent: :destroy
  has_many :VenueToVendors, dependent: :destroy
  belongs_to :Vendor
end
