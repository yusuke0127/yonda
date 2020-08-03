require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with title and content" do
    user = User.create(
      email: "tester@gmail.com",
      password: "123456"
    )

    user.posts.create(
      title: "Test",
      content: "Test content"
    )
    expect(user.posts.count).to eq 1
  end

  it "is invalid without a title" do
    user = User.create(
      email: "tester@gmail.com",
      password: "123456"
    )

    post = user.posts.create(
      title: nil,
      content: "Test content"
    )
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a user" do
    post = Post.new(
      title: "test",
      content: "Test content"
    )
    post.valid?
    expect(post.errors[:user]).to include("must exist")
  end

  it "does not allow duplicate project names per user" do
    user = User.create(
      email: "tester@gmail.com",
      password: "123456"
    )

    user.posts.create(
      title: "Test",
      content: "Test content"
    )

    new_project = user.posts.build(
      title: "Test",
      content: "Test content"
    )

    new_project.valid?
    expect(new_project.errors[:title]).to include("has already been taken")
  end
end
