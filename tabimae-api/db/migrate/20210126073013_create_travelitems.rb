class CreateTravelitems < ActiveRecord::Migration[6.0]
  def change
    create_table :travelitems do |t|
      t.string :name
      t.integer :user_id
      t.integer :travel_id
      t.timestamps
    end
  end
end
