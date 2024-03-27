# == Schema Information
#
# Table name: product_ingredients
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :integer          not null
#  product_id    :integer          not null
#
# Indexes
#
#  index_product_ingredients_on_ingredient_id  (ingredient_id)
#  index_product_ingredients_on_product_id     (product_id)
#
# Foreign Keys
#
#  ingredient_id  (ingredient_id => ingredients.id)
#  product_id     (product_id => products.id)
#
class ProductIngredient < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient
end
