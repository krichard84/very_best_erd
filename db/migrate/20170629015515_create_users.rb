class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :venues_id
      t.integer :bookmarks_id

      t.timestamps

    end
  end
end
