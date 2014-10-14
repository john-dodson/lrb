class CreateFlorists < ActiveRecord::Migration
  def change
    create_table :florists do |t|
      t.string :name
      t.belongs_to :vendor

      t.timestamps
    end
  end
end
