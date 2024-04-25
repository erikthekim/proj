class CreateAdminPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_posts do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
