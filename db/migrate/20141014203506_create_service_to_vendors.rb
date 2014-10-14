class CreateServiceToVendors < ActiveRecord::Migration
  def change
    create_table :service_to_vendors do |t|
      t.belongs_to :service
      t.belongs_to :vendor
      t.belongs_to :vendorType

      t.timestamps
    end
  end
end
