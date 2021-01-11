class AddTravelIdToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :travel_id, :integer
  end
end
