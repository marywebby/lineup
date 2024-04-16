# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  photo_url          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  type_of_product_id :integer          not null
#
# Indexes
#
#  index_products_on_type_of_product_id  (type_of_product_id)
#
# Foreign Keys
#
#  type_of_product_id  (type_of_product_id => type_of_products.id)
#
class Product < ApplicationRecord
  belongs_to :type_of_product
  has_many :routine_products
  has_many :product_ingredients
  has_many :routines, through: :routine_products
  has_many :ingredients, through: :product_ingredients

  
end
