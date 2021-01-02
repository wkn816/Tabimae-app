class AddTravelIdToAirs < ActiveRecord::Migration[6.0]
  def change
    add_column :airs, :travel_id, :integer
  end
end
