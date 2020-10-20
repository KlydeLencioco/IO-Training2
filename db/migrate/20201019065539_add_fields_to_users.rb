class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :FirstName, :string
    add_column :users, :LastName, :string
    add_column :users, :UserName, :string
  end
end
