class CreateUserVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :user_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
