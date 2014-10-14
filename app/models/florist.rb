class Florist < ActiveRecord::Base
  has_many :FloristDates, dependent: :destroy
  belongs_to :Vendor
end
