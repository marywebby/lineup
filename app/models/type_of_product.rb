# == Schema Information
#
# Table name: type_of_products
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TypeOfProduct < ApplicationRecord
  has_many :products
end
