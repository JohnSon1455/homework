class AddUserToBucket < ActiveRecord::Migration[6.1]
  def change
    add_reference :buckets, :user, foreign_key: true
  end
end
