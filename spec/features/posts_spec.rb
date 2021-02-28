require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  scenario "user creates a new post" do
    # user = FactoryBot.create(:user)
    login_as user, scope: :user

    visit('/posts/new')

    expect do
      fill_in_new_thread_form
      expect(page).to have_content "Test Post"
      expect(page).to have_content user.email.to_s
    end.to change(user.posts, :count).by(1)
  end

  scenario "user edits a post" do
    login_as user, scope: :user

    visit(post_path(post))
    click_link('edit')

    expect(page).to have_content "Edit your post"
  end

  scenario "user adds a new comment" do
    login_as user, scope: :user

    visit(post_path(post))

    expect do
      fill_in_comment_form
      expect(page).to have_content "Test Comment"
    end.to change(post.comments, :count).by(1)
  end

  scenario "user or guest searches a post" do
    visit root_path
    fill_in "Find a thread", with: "test"

    click_button "Search"
    expect(page).to have_content "test"
  end

  scenario "a guest creates a new post" do
    visit('/posts/new')
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "a guest adds a new comment" do
    # user = FactoryBot.create(:user)
    # post = FactoryBot.create(:post, user: user)
    visit(post_path(post))

    expect(page).to have_content "Log in"
  end

  scenario "user likes a post" do
    login_as user, scope: :user
    visit(post_path(post))

    expect do
      click_link "upvote"
    end.to change(post.get_upvotes, :size).by(1)
  end

  scenario "user dislikes a post" do
    login_as user, scope: :user
    visit(post_path(post))

    expect do
      click_link "downvote"
    end.to change(post.get_downvotes, :size).by(1)
  end

  def fill_in_new_thread_form
    fill_in "post_title", with: "Test Post"
    fill_in "post_content", with: "Trying out Capybara"
    click_button "Confirm"
  end

  def fill_in_comment_form
    fill_in "What's your thoughts?", with: "Test Comment"
    click_button "Comment"
  end
end
