class ChangeDatatypePhonenumberOfInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :sending_destinations, :phonenumber, :string
  end
end
