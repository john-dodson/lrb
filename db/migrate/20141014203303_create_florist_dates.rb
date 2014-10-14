class CreateFloristDates < ActiveRecord::Migration
  def change
    create_table :florist_dates do |t|
      t.belongs_to :florist
      t.date :date
      t.belongs_to :service

      t.timestamps
    end
  end
end
