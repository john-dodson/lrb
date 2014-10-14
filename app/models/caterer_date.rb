class CatererDate < ActiveRecord::Base
  belongs_to :Caterer
  belongs_to :Service
end
