require "test_helper"

class OscesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @osce = osces(:one)
  end

  test "should get index" do
    get osces_url
    assert_response :success
  end

  test "should get new" do
    get new_osce_url
    assert_response :success
  end

  test "should create osce" do
    assert_difference('Osce.count') do
      post osces_url, params: { osce: { accept_comments: @osce.accept_comments, fixed_station_order: @osce.fixed_station_order, resume: @osce.resume, title: @osce.title } }
    end

    assert_redirected_to osce_url(Osce.last)
  end

  test "should show osce" do
    get osce_url(@osce)
    assert_response :success
  end

  test "should get edit" do
    get edit_osce_url(@osce)
    assert_response :success
  end

  test "should update osce" do
    patch osce_url(@osce), params: { osce: { accept_comments: @osce.accept_comments, fixed_station_order: @osce.fixed_station_order, resume: @osce.resume, title: @osce.title } }
    assert_redirected_to osce_url(@osce)
  end

  test "should destroy osce" do
    assert_difference('Osce.count', -1) do
      delete osce_url(@osce)
    end

    assert_redirected_to osces_url
  end
end
