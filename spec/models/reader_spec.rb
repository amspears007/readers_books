require "rails_helper"

RSpec.describe Reader, type: :model do
  describe 'relationships' do
    it {should have_many :books}

  end
end