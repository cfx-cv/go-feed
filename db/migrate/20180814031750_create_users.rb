class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # Authlogic::ActsAsAuthentic::Username
      t.string    :username

      # Authlogic::ActsAsAuthentic::Email
      t.string    :email

      # Authlogic::ActsAsAuthentic::Password
      t.string    :crypted_password
      t.string    :password_salt

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string    :persistence_token
      t.index     :persistence_token, unique: true

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
