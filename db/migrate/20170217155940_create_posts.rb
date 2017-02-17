class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
