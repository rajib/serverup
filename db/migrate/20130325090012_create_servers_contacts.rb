class CreateServersContacts < ActiveRecord::Migration
  def up
  	create_table :contacts_servers do |t|
      t.integer :server_id
      t.integer :contact_id
    end  	
  end

  def down
  	drop_table :contacts_servers  	
  end
end
