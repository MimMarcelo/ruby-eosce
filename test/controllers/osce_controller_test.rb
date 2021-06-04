require "test_helper"

class OsceControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get osce_title:string_url
    assert_response :success
  end

  test "should get resume:string" do
    get osce_resume:string_url
    assert_response :success
  end

  test "should get accept_comments:boolean" do
    get osce_accept_comments:boolean_url
    assert_response :success
  end

  test "should get fixed_station_order:boolean" do
    get osce_fixed_station_order:boolean_url
    assert_response :success
  end
end
