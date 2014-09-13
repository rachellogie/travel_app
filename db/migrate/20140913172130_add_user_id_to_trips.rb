class AddUserIdToTrips < ActiveRecord::Migration
  change_table :trips do |t|
    t.belongs_to :user
    t.belongs_to :country
  end


end
