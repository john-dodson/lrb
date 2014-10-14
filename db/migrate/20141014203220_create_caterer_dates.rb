class CreateCatererDates < ActiveRecord::Migration
  def change
    create_table :caterer_dates do |t|
      t.belongs_to :caterer
      t.date :date
      t.belongs_to :service

      t.timestamps
    end
  end
end
