class CreateAirs < ActiveRecord::Migration[6.0]
  def change
    create_table :airs do |t|
      t.date :departure_day
      t.string :departure_time
      t.string :arrival_time
      t.string :departure_place
      t.string :arrival_place
      t.integer :flight_number
      t.string :airline
      t.integer :user_id
      t.timestamps
    end
  end
end
