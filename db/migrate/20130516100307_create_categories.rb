class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :tag, uniqueness: true, null: false
      t.timestamps
    end
  end
end
