class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.string :title, :null => false
      t.integer :user_id
      t.timestamps
    end
  end
end
