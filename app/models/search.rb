# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  search_term :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

# Search Model
class Search < ApplicationRecord
  belongs_to :user
  validates :search_term, presence: true
end
