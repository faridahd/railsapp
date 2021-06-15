require "application_system_test_case"

class ListitemsTest < ApplicationSystemTestCase
  setup do
    @listitem = listitems(:one)
  end

  test "visiting the index" do
    visit listitems_url
    assert_selector "h1", text: "Listitems"
  end

  test "creating a Listitem" do
    visit listitems_url
    click_on "New Listitem"

    fill_in "Item count", with: @listitem.item_count
    fill_in "Item description", with: @listitem.item_description
    fill_in "Item name", with: @listitem.item_name
    click_on "Create Listitem"

    assert_text "Listitem was successfully created"
    click_on "Back"
  end

  test "updating a Listitem" do
    visit listitems_url
    click_on "Edit", match: :first

    fill_in "Item count", with: @listitem.item_count
    fill_in "Item description", with: @listitem.item_description
    fill_in "Item name", with: @listitem.item_name
    click_on "Update Listitem"

    assert_text "Listitem was successfully updated"
    click_on "Back"
  end

  test "destroying a Listitem" do
    visit listitems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listitem was successfully destroyed"
  end
end
