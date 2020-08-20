class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :products, null: false, foreign_key: true
      t.references :carts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
