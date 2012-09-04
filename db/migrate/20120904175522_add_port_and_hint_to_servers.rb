class AddPortAndHintToServers < ActiveRecord::Migration
  def change
    add_column :servers, :port, :string
    add_column :servers, :url, :string
  end
end
