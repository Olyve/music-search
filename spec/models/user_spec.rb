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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Sam', email: 'sam@mail.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      bad_user = User.new(name: '', email: 'sam@mail.com', password: 'password')
      expect(bad_user).to_not be_valid
    end

    it 'is invalid without an email' do
      bad_user = User.new(name: 'Sam', email: '', password: 'password')
      expect(bad_user).to_not be_valid
    end

    it 'is invalid without a password' do
      bad_user = User.new(name: 'Sam', email: 'sam@mail.com', password: '')
      expect(bad_user).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'should have many searches' do
      assoc = User.reflect_on_association(:searches)
      expect(assoc.macro).to eq :has_many
    end
  end
end
