class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :vote, null: false, default: nil
      t.integer :user_id, null: false
      t.integer :review_id, null: false
    end
  end
end
