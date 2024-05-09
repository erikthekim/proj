class Adduservotes < ActiveRecord::Migration[7.1]
  def change

add_column :user_votes, :vote_type, :string, default: "up"

    
  end
end
