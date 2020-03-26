class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false, null: false, null: false, null: false, null: false, default: 0
      t.integer :item_id, null: false, null: false, null: false, null: false, default: 0
      t.integer :amount, null: false, null: false, null: false, default: 0
      t.integer :purchase_price, null: false, null: false, default: 0
      t.integer :productin_status, null: false, default: 0
      t.timestamps
    end
  end
end
