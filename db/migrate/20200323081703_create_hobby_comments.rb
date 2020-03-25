class CreateHobbyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :hobby_comments do |t|
      t.integer :user_id
      t.integer :hobby_image_id
      t.text :comment

      t.timestamps
    end
  end
end
