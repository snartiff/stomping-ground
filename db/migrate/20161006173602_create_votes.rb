class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :vote, :default => nil
      t.integer :user_id, presence:true
      t.integer :review_id, presence:true
      t.timestamps
    end
  end
end
