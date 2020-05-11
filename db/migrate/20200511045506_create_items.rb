class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.references :category, foreign_key: true
      t.references :bland, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :postage, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
