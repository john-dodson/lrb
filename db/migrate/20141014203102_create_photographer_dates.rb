class CreatePhotographerDates < ActiveRecord::Migration
  def change
    create_table :photographer_dates do |t|
      t.belongs_to :photographer
      t.date :date
      t.belongs_to :service

      t.timestamps
    end
  end
end
