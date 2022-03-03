require "application_system_test_case"

class ExamsTest < ApplicationSystemTestCase
  setup do
    @exam = exams(:one)
  end

  test "visiting the index" do
    visit exams_url
    assert_selector "h1", text: "Exams"
  end

  test "creating a Exam" do
    visit exams_url
    click_on "New Exam"

    fill_in "Schedule", with: @exam.Schedule_id
    fill_in "User", with: @exam.User_id
    fill_in "End", with: @exam.end
    fill_in "Start", with: @exam.start
    click_on "Create Exam"

    assert_text "Exam was successfully created"
    click_on "Back"
  end

  test "updating a Exam" do
    visit exams_url
    click_on "Edit", match: :first

    fill_in "Schedule", with: @exam.Schedule_id
    fill_in "User", with: @exam.User_id
    fill_in "End", with: @exam.end
    fill_in "Start", with: @exam.start
    click_on "Update Exam"

    assert_text "Exam was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam" do
    visit exams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam was successfully destroyed"
  end
end
