class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :background_img
      t.string :face_img
      t.string :location
      t.timestamps null: false
    end
  end
end
