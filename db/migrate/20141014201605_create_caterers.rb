class CreateCaterers < ActiveRecord::Migration
  def change
    create_table :caterers do |t|
      t.string :name
      t.belongs_to :vendor

      t.timestamps
    end
  end
end
