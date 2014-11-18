class VendorDate < ActiveRecord::Base
  belongs_to :Vendor
  belongs_to :Service
end
