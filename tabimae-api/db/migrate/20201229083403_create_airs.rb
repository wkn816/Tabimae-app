class CreateAirs < ActiveRecord::Migration[6.0]
  def change
    create_table :airs do |t|

      t.timestamps
    end
  end
end
