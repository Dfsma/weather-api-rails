class AddUserToWeathers < ActiveRecord::Migration[6.0]
  def change
    add_reference :weathers, :user, null: false, foreign_key: true
  end
end
