class CreateVendorTypes < ActiveRecord::Migration
  def change
    create_table :vendor_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
