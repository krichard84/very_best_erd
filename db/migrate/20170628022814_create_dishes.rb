class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :cuisines_id
      t.string :name
      t.integer :venues_id
      t.integer :user_id

      t.timestamps

    end
  end
end
