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
  has_many :products, through: :routine_products

  validate :no_duplicate_products
  validates :name, presence: true, inclusion: { in: ["Morning Routine", "Evening Routine", "Weekend Routine"] }

  # syntax for getting the products in a specific routine, first one, 
    # routine = User.first.routines[0]

  # calling the chat servise in the ruby console
    # ChatService.new(message: "test message", routine: routine).call

    def prompt
      <<-TEXT
      You are a skincare specialist who is helping someone organize their routine products.
      For each of the products here, place them into their respective order of use based off of the type of product it is (i.e moisturizer, toner, eye cream, sunscreen, face wash).
      Respond in HTML with the correct order and display them as a numbered list, below each on the items give an explanation as to why you placed it in that order, and then move on to the next item.
  
      #{products.map(&:name).join(", ")}
      TEXT
    end

  private

  def no_duplicate_products
    product_ids = routine_products.pluck(:product_id)
    
    duplicates = product_ids.select { |product_id| product_ids.count(product_id) > 1 }
    
    if duplicates.any?
      errors.add(:base, "Routine cannot contain duplicate products")
    end
  end
end
