require "test_helper"

class DailyResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get daily_responses_new_url
    assert_response :success
  end

  test "should get create" do
    get daily_responses_create_url
    assert_response :success
  end

  test "should get index" do
    get daily_responses_index_url
    assert_response :success
  end
end
