class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.references :user, null: false, foreing_key: true
      t.references :item, null: false, foreign_key: true
      t.text :comment, null: false
      t.integer :review, null: false
      t.timestamps
    end
  end
end
