require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get create" do
    get reviews_create_url
    assert_response :success
  end

end
