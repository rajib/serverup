class AddUserIdToServers < ActiveRecord::Migration
  def change
    add_column :servers, :user_id, :integer
  end
end
