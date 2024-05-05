class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties do |t|
      t.string :title
      t.text :description
      t.integer :interest_count

      t.timestamps
    end
  end
end
