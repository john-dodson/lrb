class ServiceToVendor < ActiveRecord::Base
  belongs_to :Service
  belongs_to :Vendor
end
