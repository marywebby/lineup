# == Schema Information
#
# Table name: routines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_routines_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Routine < ApplicationRecord
  belongs_to :user
  has_many :routine_products

  validate :no_duplicate_products

  private

  def no_duplicate_products
    product_ids = routine_products.pluck(:product_id)
    
    duplicates = product_ids.select { |product_id| product_ids.count(product_id) > 1 }
    
    if duplicates.any?
      errors.add(:base, "Routine cannot contain duplicate products")
    end
  end
end
