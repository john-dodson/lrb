class VenueDate < ActiveRecord::Base
  belongs_to :Venue
  belongs_to :Service
end
