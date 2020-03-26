class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.string :postal_code, null: false
      t.string :domicile, null: false
      t.string :name, null: false
      t.integer :payment_method, null: false
      t.integer :freight_fee, null: false, default: 800
      t.integer :total_due, null: false
      t.integer :order_stauts, null: false, default: 0
      t.timestamps
    end
  end
end
