require 'rails_helper'

RSpec.describe User, type: :model do

  describe "user validations" do
    it "Should have password and confirmed Password" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
    expect(@user).to be_valid
    end

    it "Should fail for missing name" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com')
    expect(@user).to be_invalid
    end

    it "Should fail for misMatched Passwords" do
      @user = User.new(password: '12345', password_confirmation: '1235', email: 'test@test.com', name: "stephan")
    expect(@user).to be_invalid
    end

    it "Passwords too short" do
      @user = User.new(password: '12', password_confirmation: '12', email: 'test@test.com', name: "stephan")
    expect(@user).to be_invalid
    end

    it "Passwords too long" do
      @user = User.new(password: '123456789', password_confirmation: '123456789', email: 'test@test.com', name: "stephan")
    expect(@user).to be_invalid
    end

    it "Passwords should pass" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
    expect(@user).to be_valid
    end

    it "Passwords should pass" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
    expect(@user).to be_valid
    end

    it "Passwords should pass" do
      @user1 = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user1.save!
      @user2 = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "phil")
    expect(@user2).to be_invalid
    end
    it "Passwords should pass" do
      @user1 = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user1.save!
      @user2 = User.new(password: '12345', password_confirmation: '12345', email: 'TesT@tEsT.com', name: "phil")
    expect(@user2).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticates the user with correct login information" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end
    it "Fails the user with incorrect password" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, "chicken")).to_not eq(@user)
    end
    it "Fails the user with incorrect email" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user.save!
      expect(@user.authenticate_with_credentials('wrongEmail@email.com', @user.password)).to_not eq(@user)
    end

    it "pass for whitespace on email OR password" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user.save!
      expect(@user.authenticate_with_credentials(' test@test.com ', '  12345 ')).to eq(@user)
    end

    it "pass for whitespace on email OR password" do
      @user = User.new(password: '12345', password_confirmation: '12345', email: 'test@test.com', name: "stephan")
      @user.save!
      expect(@user.authenticate_with_credentials('TEST@test.com', '  12345 ')).to eq(@user)
    end
  end
end
