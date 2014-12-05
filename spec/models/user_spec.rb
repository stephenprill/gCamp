require 'rails_helper'

describe User do

  it "validates the valid presence of email for users" do
    user = User.new
    user.email = "chaka@khan.com"
    user.valid?
    expect(user.errors[:email].present?).to eq(false)
   end

  it "validates the invalid of email for users" do
    user = User.new
    user.valid?
    expect(user.errors[:email].present?).to eq(true)
  end

  it "does not allow duplicate emails" do
    user1 = create_user
    user = User.new(email: user1.email )
    user.valid?
    expect(user.errors[:email].present?).to eq(true)
  end

  it "allows user for different emails" do
    User.create!(first_name: "Chaka", last_name: "Khan", email: "chaka@khan.com", password: "pass")
    user = User.new(email:"chaka@mon.com")
    user.valid?
    expect(user.errors[:email].present?).to eq(false)
   end

   it "allows user for case sensitivity emails" do
     User.create!(first_name: "Chaka", last_name: "Khan", email: "chaka@khan.com", password: "pass")
     user = User.new(email:"chaka@KHAN.com")
     user.valid?
     expect(user.errors[:email].present?).to eq(true)
    end



 end
