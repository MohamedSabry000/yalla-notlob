class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total
      t.string :order_type
      t.string :restaurant_name
      t.string :img
      t.string :status

      t.timestamps
    end
  end
end
