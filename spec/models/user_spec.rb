require 'rails_helper'

RSpec.describe User, type: :model do
  class User
    # let(:user) { create(:user) }
    before :all do 
      email = "test@mail.com"
      password = "12345"
    end
  
    context ".login" do
      expect(User.login({email: 'aaa@aa.aa'})).to eq(user)
    end
    
  end
end
