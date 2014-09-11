class AddVisitedToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :visited, :boolean, :default => :false
  end
end
