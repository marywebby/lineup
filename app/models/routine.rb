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
  has_many :routine_products, dependent: :delete_all
  has_many :products, through: :routine_products
  has_many :messages

  validate :no_duplicate_products
  validates :name, presence: true

  # syntax for getting the products in a specific routine, first one, 
    # routine = User.first.routines[0]

  # calling the chat servise in the ruby console
    # ChatService.new(message: "test message", routine: routine).call

    def prompt
      <<-TEXT
      You are a skincare specialist who is helping someone organize their routine products.
      For each of the products here, place them into their respective order of use based off of the type of product it is (i.e moisturizer, toner, eye cream, sunscreen, face wash).
      Respond in HTML with the correct order of usage and display the output of what order a user should use the products in a numbered list, included with the number before each product (for example, '1.)', '2.)', '3.)'), and then below each on the items indented in a `<p>' tag, give an explanation as to why you placed it in that order, and then move on to the next item. Also provide the suggest time you should wait between using each product for example (3 to 4 minutes). Make sure to note that if there is facewash in the routine, make sure that one goes first, and if there is sunscreen in the products. 
  
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
