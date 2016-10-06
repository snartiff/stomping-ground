class AddPictureColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :avatar, :string
  end
end
