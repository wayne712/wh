require "application_system_test_case"

class AcquiresTest < ApplicationSystemTestCase
  setup do
    @acquire = acquires(:one)
  end

  test "visiting the index" do
    visit acquires_url
    assert_selector "h1", text: "Acquires"
  end

  test "creating a Acquire" do
    visit acquires_url
    click_on "New Acquire"

    click_on "Create Acquire"

    assert_text "Acquire was successfully created"
    click_on "Back"
  end

  test "updating a Acquire" do
    visit acquires_url
    click_on "Edit", match: :first

    click_on "Update Acquire"

    assert_text "Acquire was successfully updated"
    click_on "Back"
  end

  test "destroying a Acquire" do
    visit acquires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acquire was successfully destroyed"
  end
end
