class Vendor < ActiveRecord::Base
  has_many :ServiceToVendors, dependent: :destroy
  has_many :VenueToVendors, dependent: :destroy
  has_many :Services, :through => :ServiceToVendors
  has_many :Venues, dependent: :destroy
  has_many :Caterers, dependent: :destroy
  has_many :Florists, dependent: :destroy
  has_many :Photographers, dependent: :destroy
  belongs_to :VendorType
end
