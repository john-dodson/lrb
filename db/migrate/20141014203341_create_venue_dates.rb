class CreateVenueDates < ActiveRecord::Migration
  def change
    create_table :venue_dates do |t|
      t.belongs_to :venue
      t.date :date
      t.belongs_to :service

      t.timestamps
    end
  end
end
