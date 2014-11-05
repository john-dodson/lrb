class CreateVendorTypes < ActiveRecord::Migration
  def change
    create_table :vendor_types do |t|
      t.string :vendor_type

      t.timestamps
    end
  end
end
