require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit "/"
    assert_selector "h3", text: "Make a Thread"
    assert_selector ".post-info-title", count: Post.count
  end


  test "lets a signed in user create a new post" do
    login_as users(:yusuke)
    visit "/posts/new"
    # save_and_open_screenshot

    fill_in "post_title", with: "Le Wagon"
    fill_in "post_content", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Confirm'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    # assert_equal post_path(:id), page.current_path
    assert_text "Change your life: Learn to code"
  end
end
