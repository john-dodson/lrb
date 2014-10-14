class Service < ActiveRecord::Base
  has_many :ServiceToVendors, dependent: :destroy
  has_many :CatererDates, dependent: :destroy
  has_many :FloristDates, dependent: :destroy
  has_many :PhotographerDates, dependent: :destroy
  has_many :VenueDates, dependent: :destroy
end
