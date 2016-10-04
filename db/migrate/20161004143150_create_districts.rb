class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name, presence: true
      t.timestamps
    end
  end
end
