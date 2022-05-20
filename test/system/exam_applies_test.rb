require "application_system_test_case"

class ExamAppliesTest < ApplicationSystemTestCase
  setup do
    @exam_apply = exam_applies(:one)
  end

  test "visiting the index" do
    visit exam_applies_url
    assert_selector "h1", text: "Exam Applies"
  end

  test "creating a Exam apply" do
    visit exam_applies_url
    click_on "New Exam Apply"

    fill_in "Exam", with: @exam_apply.exam_id
    fill_in "Student email", with: @exam_apply.student_email
    fill_in "Student", with: @exam_apply.student_id
    fill_in "Student name", with: @exam_apply.student_name
    click_on "Create Exam apply"

    assert_text "Exam apply was successfully created"
    click_on "Back"
  end

  test "updating a Exam apply" do
    visit exam_applies_url
    click_on "Edit", match: :first

    fill_in "Exam", with: @exam_apply.exam_id
    fill_in "Student email", with: @exam_apply.student_email
    fill_in "Student", with: @exam_apply.student_id
    fill_in "Student name", with: @exam_apply.student_name
    click_on "Update Exam apply"

    assert_text "Exam apply was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam apply" do
    visit exam_applies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam apply was successfully destroyed"
  end
end
