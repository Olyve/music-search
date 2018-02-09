# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string
#  email             :string
#  password          :string
#  spotify_token     :string
#  apple_music_token :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

# User Model
class User < ApplicationRecord
  has_many :searches
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
