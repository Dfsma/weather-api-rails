class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.integer :degrees
      t.integer :wind_speed
      t.integer :clouds

      t.timestamps
    end
  end
end
