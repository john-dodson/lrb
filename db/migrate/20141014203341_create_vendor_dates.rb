class CreateVendorDates < ActiveRecord::Migration
  def change
    create_table :vendor_dates do |t|
      t.belongs_to :vendor
      t.date :date
      t.belongs_to :service

      t.timestamps
    end
  end
end
