require 'spec_helper'

describe User do
  context "Validation" do
    it "should not save user when password and confirmation do not match" do
      user = {
        email: 'coolname',
        password: 'right',
        password_confirmation: 'wrong'
      }
      expect{User.create(user)}.not_to change{User.count}
    end
    it "should not save user with duplicate email" do
      user = {
        email: 'duplicate',
        password: 'right',
        password_confirmation: 'right'
      }
      expect{User.create(user)}.to change{User.count}.by(1)
      expect{User.create(user)}.not_to change{User.count}
    end
  end
end
