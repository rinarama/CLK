class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user_id, foreign_key: true
      t.integer :requester_id
      t.boolean :status

      t.timestamps
    end
  end
end
