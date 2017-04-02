class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :background_img
      t.string :face_img
      t.string :location
      t.text :content
      t.string :user_name
      t.string :user_img_url
      t.timestamps null: false
    end
  end
end
