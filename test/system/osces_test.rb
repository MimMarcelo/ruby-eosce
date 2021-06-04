require "application_system_test_case"

class OscesTest < ApplicationSystemTestCase
  setup do
    @osce = osces(:one)
  end

  test "visiting the index" do
    visit osces_url
    assert_selector "h1", text: "Osces"
  end

  test "creating a Osce" do
    visit osces_url
    click_on "New Osce"

    check "Accept comments" if @osce.accept_comments
    check "Fixed station order" if @osce.fixed_station_order
    fill_in "Resume", with: @osce.resume
    fill_in "Title", with: @osce.title
    click_on "Create Osce"

    assert_text "Osce was successfully created"
    click_on "Back"
  end

  test "updating a Osce" do
    visit osces_url
    click_on "Edit", match: :first

    check "Accept comments" if @osce.accept_comments
    check "Fixed station order" if @osce.fixed_station_order
    fill_in "Resume", with: @osce.resume
    fill_in "Title", with: @osce.title
    click_on "Update Osce"

    assert_text "Osce was successfully updated"
    click_on "Back"
  end

  test "destroying a Osce" do
    visit osces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Osce was successfully destroyed"
  end
end
