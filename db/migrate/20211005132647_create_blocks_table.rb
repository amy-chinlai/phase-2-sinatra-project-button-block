class CreateBlocksTable < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.string :name
      t.string :donation_type
      t.integer :user_id
    end
  end
end
