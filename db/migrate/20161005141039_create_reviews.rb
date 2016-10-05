class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.integer :district_id, null: false
      t.integer :user_id, null: false
      t.string :

      t.timestamps
    end
  end
end
