class CreateServerHistories < ActiveRecord::Migration
  def change
    create_table :server_histories do |t|
      t.integer :server_id
      t.string :status

      t.timestamps
    end
  end
end
