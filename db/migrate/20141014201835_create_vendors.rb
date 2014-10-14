class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :type
      t.belongs_to :vendor_type

      t.timestamps
    end
  end
end
