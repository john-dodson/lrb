class FloristDate < ActiveRecord::Base
  belongs_to :Florist
  belongs_to :Service
end
