class CreateAirs < ActiveRecord::Migration[6.0]
  def change
    create_table :airs do |t|
      t.date :departure_day
      t.time :departure_time
      t.time :arrival_time
      t.string :departure_place
      t.string :arrival_plac
      t.integer :flight_number
      t.string :airline
      t.integer :user_id
      t.timestamps
    end
  end
end
