require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "user creates a new post" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect do
      fill_in "Title", with: "Test Post"
      fill_in "Content", with: "Trying out Capybara"
      click_button "Confirm"
      expect(page).to have_content "Test Post"
      expect(page).to have_content "#{user.email}"
    end.to change(user.posts, :count).by(1)
  end
end
