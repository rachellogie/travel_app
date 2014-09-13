class AddVisitedToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :visited, :boolean, :default => :false
  end
end
