require "test_helper"

class StationAppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_apply = station_applies(:one)
  end

  test "should get index" do
    get station_applies_url
    assert_response :success
  end

  test "should get new" do
    get new_station_apply_url
    assert_response :success
  end

  test "should create station_apply" do
    assert_difference('StationApply.count') do
      post station_applies_url, params: { station_apply: { exam_apply_id: @station_apply.exam_apply_id, finished: @station_apply.finished, time_left: @station_apply.time_left } }
    end

    assert_redirected_to station_apply_url(StationApply.last)
  end

  test "should show station_apply" do
    get station_apply_url(@station_apply)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_apply_url(@station_apply)
    assert_response :success
  end

  test "should update station_apply" do
    patch station_apply_url(@station_apply), params: { station_apply: { exam_apply_id: @station_apply.exam_apply_id, finished: @station_apply.finished, time_left: @station_apply.time_left } }
    assert_redirected_to station_apply_url(@station_apply)
  end

  test "should destroy station_apply" do
    assert_difference('StationApply.count', -1) do
      delete station_apply_url(@station_apply)
    end

    assert_redirected_to station_applies_url
  end
end
