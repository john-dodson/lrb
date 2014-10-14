class PhotographerDate < ActiveRecord::Base
  belongs_to :Photographer
  belongs_to :Service
end
