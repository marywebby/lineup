# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  role       :string           default("user")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  routine_id :integer
#
class Message < ApplicationRecord
  enum role: { user: "user", system: "system", assistant: "assistant" }
  belongs_to :routine
end
