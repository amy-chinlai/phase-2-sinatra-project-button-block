class CreateButtonsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :buttons do |t|
      t.integer :multiplier
      t.integer :default
      t.integer :block_id
    end
  end
end
