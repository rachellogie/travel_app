class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date  :date
      t.timestamps
    end
  end
end
