class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.references :username, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.text :keyword

      t.timestamps null: false
    end
  end
end
