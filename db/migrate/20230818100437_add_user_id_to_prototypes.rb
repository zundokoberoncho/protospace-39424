class AddUserIdToPrototypes < ActiveRecord::Migration[6.0]
  def change
    add_column :prototypes, :user_id, :integer
    add_column :users, :occupation, :string
    add_column :users, :position, :string
    add_index :prototypes, :user_id
  end
end
