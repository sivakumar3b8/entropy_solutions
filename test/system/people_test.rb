require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Bank account number", with: @person.bank_account_number
    fill_in "First name", with: @person.first_name
    fill_in "Ifsc code", with: @person.ifsc_code
    fill_in "Last name", with: @person.last_name
    fill_in "Phone number", with: @person.phone_number
    fill_in "Swift number", with: @person.swift_number
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Bank account number", with: @person.bank_account_number
    fill_in "First name", with: @person.first_name
    fill_in "Ifsc code", with: @person.ifsc_code
    fill_in "Last name", with: @person.last_name
    fill_in "Phone number", with: @person.phone_number
    fill_in "Swift number", with: @person.swift_number
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end