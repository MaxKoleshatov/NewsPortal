class AddProfileNameUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profilename, :string, null: false
  end
end
