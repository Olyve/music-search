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

require 'rails_helper'

RSpec.describe Search, type: :model do
  subject do
    User.new(name: 'Sam', email: 'sam@mail.com', password: 'password')
  end

  describe 'Validations' do
    it "is valid with valid properties" do
      search = Search.new(
        search_term: 'music',
        user: subject
      )
      expect(search).to be_valid
    end

    it "is invalid without a search term" do
      bad_search = Search.new(
        search_term: nil,
        user: subject
      )
      expect(bad_search).to_not be_valid
    end

    it "is invalid without a user" do
      bad_search = Search.new(
        search_term: "TestTerm",
        user: nil
      )
      expect(bad_search).to_not be_valid
    end
  end

  describe "Associations" do
    it "should have one User" do
      assoc = Search.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
