class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :uniqueness => true, :null => false
      t.string :password_hash, :null => false
      t.timestamps
    end
  end
end
