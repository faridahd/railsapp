class AddUserIdToListitems < ActiveRecord::Migration[6.1]
  def change
    add_column :listitems, :user_id, :integer
    add_index :listitems, :user_id
  end
end
