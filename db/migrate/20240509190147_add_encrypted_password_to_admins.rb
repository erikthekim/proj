class AddEncryptedPasswordToAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :admins, :encrypted_password, :string
  end
end
