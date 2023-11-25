class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.integer :frequency
      t.integer :customer_id
      t.string :status

      t.timestamps
    end
  end
end
