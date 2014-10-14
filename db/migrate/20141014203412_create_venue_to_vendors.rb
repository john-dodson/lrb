class CreateVenueToVendors < ActiveRecord::Migration
  def change
    create_table :venue_to_vendors do |t|
      t.belongs_to :venue
      t.belongs_to :vendor
      t.belongs_to :venue_type

      t.timestamps
    end
  end
end
