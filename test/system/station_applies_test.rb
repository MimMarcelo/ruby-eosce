require "application_system_test_case"

class StationAppliesTest < ApplicationSystemTestCase
  setup do
    @station_apply = station_applies(:one)
  end

  test "visiting the index" do
    visit station_applies_url
    assert_selector "h1", text: "Station Applies"
  end

  test "creating a Station apply" do
    visit station_applies_url
    click_on "New Station Apply"

    fill_in "Exam apply", with: @station_apply.exam_apply_id
    check "Finished" if @station_apply.finished
    fill_in "Time left", with: @station_apply.time_left
    click_on "Create Station apply"

    assert_text "Station apply was successfully created"
    click_on "Back"
  end

  test "updating a Station apply" do
    visit station_applies_url
    click_on "Edit", match: :first

    fill_in "Exam apply", with: @station_apply.exam_apply_id
    check "Finished" if @station_apply.finished
    fill_in "Time left", with: @station_apply.time_left
    click_on "Update Station apply"

    assert_text "Station apply was successfully updated"
    click_on "Back"
  end

  test "destroying a Station apply" do
    visit station_applies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Station apply was successfully destroyed"
  end
end
