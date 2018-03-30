class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :token_type
      t.integer :token_index
      t.text :message
      t.string :client_id
      t.string :serial_number
      t.boolean :served, default: false
      t.timestamps
    end
  end
end
