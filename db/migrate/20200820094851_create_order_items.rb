class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :products_references
      t.string :orders_references

      t.timestamps
    end
  end
end
