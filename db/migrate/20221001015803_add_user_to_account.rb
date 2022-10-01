class AddUserToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account ,:string
  end
end
