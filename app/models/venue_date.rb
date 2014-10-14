class VenueDate < ActiveRecord::Base
  belongs_to :Vendue
  belongs_to :Service
end
