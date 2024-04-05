class DropTableProduct < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_ingredients if ActiveRecord::Base.connection.table_exists? :product_ingredients
    drop_table :routine_products if ActiveRecord::Base.connection.table_exists? :routine_products
    drop_table :products if ActiveRecord::Base.connection.table_exists? :products 
    drop_table :type_of_products if ActiveRecord::Base.connection.table_exists? :type_of_products
  end
end
