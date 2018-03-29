class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :token_type
      t.text :message
      t.string :client_id
      t.string :response_token
      t.boolean :served, default: false

      t.timestamps
    end

  end
end
