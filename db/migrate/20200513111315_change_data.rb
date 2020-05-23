class ChangeData < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birthyear, :integer
    change_column :users, :birthmonth, :integer
    change_column :users, :birthday, :integer
  end
end
