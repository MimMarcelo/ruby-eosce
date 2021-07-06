require "application_system_test_case"

class StationTemplatesTest < ApplicationSystemTestCase
  setup do
    @station_template = station_templates(:one)
  end

  test "visiting the index" do
    visit station_templates_url
    assert_selector "h1", text: "Station Templates"
  end

  test "creating a Station template" do
    visit station_templates_url
    click_on "New Station Template"

    fill_in "Evaluation", with: @station_template.evaluation
    fill_in "Level", with: @station_template.level
    fill_in "Minutes", with: @station_template.minutes
    fill_in "Name", with: @station_template.name
    fill_in "Procedure", with: @station_template.procedure
    fill_in "Resume", with: @station_template.resume
    fill_in "Score", with: @station_template.score
    click_on "Create Station template"

    assert_text "Station template was successfully created"
    click_on "Back"
  end

  test "updating a Station template" do
    visit station_templates_url
    click_on "Edit", match: :first

    fill_in "Evaluation", with: @station_template.evaluation
    fill_in "Level", with: @station_template.level
    fill_in "Minutes", with: @station_template.minutes
    fill_in "Name", with: @station_template.name
    fill_in "Procedure", with: @station_template.procedure
    fill_in "Resume", with: @station_template.resume
    fill_in "Score", with: @station_template.score
    click_on "Update Station template"

    assert_text "Station template was successfully updated"
    click_on "Back"
  end

  test "destroying a Station template" do
    visit station_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Station template was successfully destroyed"
  end
end
