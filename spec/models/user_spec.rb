require 'rails_helper'

describe User, type: :model do
    User.new(email: 'test@example.com', password: "123456", password_confirmation: "123456"  )
    it { is_expected.to validate_presence_of(:email) }
end
