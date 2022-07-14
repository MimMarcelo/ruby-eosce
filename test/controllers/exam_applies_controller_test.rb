require "test_helper"

class ExamAppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_apply = exam_applies(:one)
  end

  test "should get index" do
    get exam_applies_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_apply_url
    assert_response :success
  end

  test "should create exam_apply" do
    assert_difference('ExamApply.count') do
      post exam_applies_url, params: { exam_apply: { exam_id: @exam_apply.exam_id, student_email: @exam_apply.student_email, student_id: @exam_apply.student_id, student_name: @exam_apply.student_name } }
    end

    assert_redirected_to exam_apply_url(ExamApply.last)
  end

  test "should show exam_apply" do
    get exam_apply_url(@exam_apply)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_apply_url(@exam_apply)
    assert_response :success
  end

  test "should update exam_apply" do
    patch exam_apply_url(@exam_apply), params: { exam_apply: { exam_id: @exam_apply.exam_id, student_email: @exam_apply.student_email, student_id: @exam_apply.student_id, student_name: @exam_apply.student_name } }
    assert_redirected_to exam_apply_url(@exam_apply)
  end

  test "should destroy exam_apply" do
    assert_difference('ExamApply.count', -1) do
      delete exam_apply_url(@exam_apply)
    end

    assert_redirected_to exam_applies_url
  end
end
