class CreateAdminUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.text :bio

      t.timestamps
    end
  end
end
