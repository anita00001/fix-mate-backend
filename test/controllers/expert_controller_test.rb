require "test_helper"

class ExpertControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expert_index_url
    assert_response :success
  end

  test "should get new" do
    get expert_new_url
    assert_response :success
  end

  test "should get show" do
    get expert_show_url
    assert_response :success
  end
end
