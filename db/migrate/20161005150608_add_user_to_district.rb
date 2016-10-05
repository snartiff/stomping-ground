class AddUserToDistrict < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :user_id, :integer, null: false
    add_column :districts, :description, :text, null: false
    add_column :districts, :photo_url, :text
  end
end
