class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      # t.string :transport
      # t.string :name
      # t.integer :user_id
      t.timestamps
    end
  end
end
