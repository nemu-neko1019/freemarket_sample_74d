class RenamePrefectureCodeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :sending_destinations, :prefecture_code, :prefecture_id
  end
end
