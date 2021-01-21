require "application_system_test_case"

class LinkersTest < ApplicationSystemTestCase
  setup do
    @linker = linkers(:one)
  end

  test "visiting the index" do
    visit linkers_url
    assert_selector "h1", text: "Linkers"
  end

  test "creating a Linker" do
    visit linkers_url
    click_on "New Linker"

    click_on "Create Linker"

    assert_text "Linker was successfully created"
    click_on "Back"
  end

  test "updating a Linker" do
    visit linkers_url
    click_on "Edit", match: :first

    click_on "Update Linker"

    assert_text "Linker was successfully updated"
    click_on "Back"
  end

  test "destroying a Linker" do
    visit linkers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linker was successfully destroyed"
  end
end
