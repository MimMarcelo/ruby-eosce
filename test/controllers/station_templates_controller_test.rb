require "test_helper"

class StationTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_template = station_templates(:one)
  end

  test "should get index" do
    get station_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_station_template_url
    assert_response :success
  end

  test "should create station_template" do
    assert_difference('StationTemplate.count') do
      post station_templates_url, params: { station_template: { evaluation: @station_template.evaluation, level: @station_template.level, minutes: @station_template.minutes, name: @station_template.name, procedure: @station_template.procedure, resume: @station_template.resume, score: @station_template.score } }
    end

    assert_redirected_to station_template_url(StationTemplate.last)
  end

  test "should show station_template" do
    get station_template_url(@station_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_template_url(@station_template)
    assert_response :success
  end

  test "should update station_template" do
    patch station_template_url(@station_template), params: { station_template: { evaluation: @station_template.evaluation, level: @station_template.level, minutes: @station_template.minutes, name: @station_template.name, procedure: @station_template.procedure, resume: @station_template.resume, score: @station_template.score } }
    assert_redirected_to station_template_url(@station_template)
  end

  test "should destroy station_template" do
    assert_difference('StationTemplate.count', -1) do
      delete station_template_url(@station_template)
    end

    assert_redirected_to station_templates_url
  end
end
