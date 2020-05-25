class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :condition_id, null: false
      t.integer :postage_payer_id, null: false
      t.references :buyer, foreign_key: { to_table: :users }, null: true
      t.references :seller, foreign_key: { to_table: :users }, null: false
      t.integer :prefecture_id, null: false
      t.timestamp :deal_closed_date
      t.string :preparation_day_id, null:false
      t.timestamps
    end
  end
end