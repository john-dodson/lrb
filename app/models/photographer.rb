class Photographer < ActiveRecord::Base
  has_many :PhotographerDates, dependent: :destroy
  belongs_to :Vendor
end
