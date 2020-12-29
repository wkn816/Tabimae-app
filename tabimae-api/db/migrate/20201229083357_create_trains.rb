class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|

      t.timestamps
    end
  end
end
