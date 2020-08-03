require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a email and password" do
    user = User.new(
      email: "tester@gmail.com",
      password: '123456'
    )

    expect(user).to be_valid
  end
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
    User.create(
      email: "tester@gmail.com",
      password: "123456"
    )

    user = User.new(
      email: "tester@gmail.com",
      password: '123456'
    )

    user.valid?

    expect(user.errors[:email]).to include('has already been taken')
  end
  it "returns a user's full name as a string"
end
