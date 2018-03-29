class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients, {id: false, primary_key: :client_id} do |t|
      t.string :id, null: false
      t.timestamps
    end

    add_index :clients, :id, unique: true
  end
end
