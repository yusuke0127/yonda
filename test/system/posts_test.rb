require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit posts_url

    assert_selector "h3", text: "Make a Thread"
  end
end
