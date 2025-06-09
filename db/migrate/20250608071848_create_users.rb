class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## OmniAuth
      t.string :provider
      t.string :uid

      ## User Info
      t.string :name
      t.string :line_user_id

      ## Rememberable
      t.datetime :remember_created_at

      ## Timestamps
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, [:provider, :uid],     unique: true
    add_index :users, :line_user_id,         unique: true
  end
end
