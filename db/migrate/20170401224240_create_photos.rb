class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :avatar_one
      t.string :avatar_two
      t.timestamps null: false
    end
  end
end
