require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "is valid with content" do
    user = User.create(
      email: "tester@gmail.com",
      password: "123456"
    )

    post = user.posts.create(
      title: "test",
      content: "Test content"
    )

    comment = post.comments.new(
      content: "test content",
      user: user
    )
    comment.valid?

    expect(comment).to be_valid
  end

  it "is invalid without a user" do
    user = User.create(
      email: "tester@gmail.com",
      password: "123456"
    )
    post = user.posts.create(
      title: "test",
      content: "Test content"
    )

    comment = post.comments.new(
      content: "test content",
      user: nil
    )
    comment.valid?

    expect(comment.errors[:user]).to include("must exist")
  end
end
