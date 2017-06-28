class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :dishes_id
      t.integer :cuisine_id
      t.integer :venues_id

      t.timestamps

    end
  end
end
