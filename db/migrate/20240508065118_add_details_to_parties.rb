class AddDetailsToParties < ActiveRecord::Migration[7.1]
  def change
    add_column :parties, :time, :datetime   # Adds a 'time' column for the event time
    add_column :parties, :host, :string     # Adds a 'host' column to store the name of the host
    add_column :parties, :alcohol_available, :boolean, default: false  # Adds a boolean 'alcohol_available'

    # Optionally, you could also add an index on host or any other frequently queried fields
    add_index :parties, :host
  end
end
