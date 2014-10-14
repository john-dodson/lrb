class Caterer < ActiveRecord::Base
  has_many :CatererDates, dependent: :destroy
  belongs_to :Vendor
end
