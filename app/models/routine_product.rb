# == Schema Information
#
# Table name: routine_products
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer          not null
#  routine_id :integer          not null
#
# Indexes
#
#  index_routine_products_on_product_id  (product_id)
#  index_routine_products_on_routine_id  (routine_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#  routine_id  (routine_id => routines.id)
#
class RoutineProduct < ApplicationRecord
  belongs_to :routine
  belongs_to :product
end
