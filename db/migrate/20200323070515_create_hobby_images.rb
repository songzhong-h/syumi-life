class CreateHobbyImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hobby_images do |t|
      t.integer :user_id
      t.text :name
      t.string :image_id
      t.text :caption

      t.timestamps
    end
  end
end
