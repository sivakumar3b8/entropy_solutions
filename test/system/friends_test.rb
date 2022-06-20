require "application_system_test_case"

class FriendsTest < ApplicationSystemTestCase
  setup do
    @friend = friends(:one)
  end

  test "visiting the index" do
    visit friends_url
    assert_selector "h1", text: "Friends"
  end

  test "creating a Friend" do
    visit friends_url
    click_on "New Friend"

    fill_in "Bank account number", with: @friend.bank_account_number
    fill_in "First name", with: @friend.first_name
    fill_in "Ifsc code", with: @friend.ifsc_code
    fill_in "Index", with: @friend.index
    fill_in "Last name", with: @friend.last_name
    fill_in "New", with: @friend.new
    fill_in "Phone number", with: @friend.phone_number
    fill_in "Show", with: @friend.show
    fill_in "Swift number", with: @friend.swift_number
    click_on "Create Friend"

    assert_text "Friend was successfully created"
    click_on "Back"
  end

  test "updating a Friend" do
    visit friends_url
    click_on "Edit", match: :first

    fill_in "Bank account number", with: @friend.bank_account_number
    fill_in "First name", with: @friend.first_name
    fill_in "Ifsc code", with: @friend.ifsc_code
    fill_in "Index", with: @friend.index
    fill_in "Last name", with: @friend.last_name
    fill_in "New", with: @friend.new
    fill_in "Phone number", with: @friend.phone_number
    fill_in "Show", with: @friend.show
    fill_in "Swift number", with: @friend.swift_number
    click_on "Update Friend"

    assert_text "Friend was successfully updated"
    click_on "Back"
  end

  test "destroying a Friend" do
    visit friends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friend was successfully destroyed"
  end
end
