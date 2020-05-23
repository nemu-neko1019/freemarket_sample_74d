class ChangeItemSizeToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :size, true
  end
end
