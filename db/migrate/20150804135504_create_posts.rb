class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :username, index: true, foreign_key: true
      t.references :keyword, index: true, foreign_key: true
      t.text :post

      t.timestamps null: false
    end
  end
end
