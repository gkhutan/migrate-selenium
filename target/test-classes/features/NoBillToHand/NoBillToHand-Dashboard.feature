Feature: Dashboard - No bill to hand

  Background: 

  @ready
  Scenario: The correct Address (ee00ee), Preferences, Personal details are shown on the dashboard - no bill to hand, Electric
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","No bill to hand","London","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Econ meter yes" radio button
    And user has selected their default energy supplier information
    When user selects the size of their home "large"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is     | My insulation is |
      | 1 Person          | Gas                  | Low user (second home) | Paper-thin       |
    Then user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "0103 1980"
    And user enters their details to register
      | form fields           | value                    |
      | title                 | Mr                       |
      | firstname             | Gurdeep                  |
      | lastname              | Test                     |
      | Phone number          |              01903242773 |
      | house no              | 20a                      |
      | first line of address | Preston Road, Littlemore |
      | employment status     | Self Employed            |
      | residential status    | Landlord                 |
      | electric meter number |            1013092420412 |
      | account name          | Test Account Name        |
      | account number        |                 55779911 |
      | sort code             |                   200000 |
    And user selects the "T&Cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user validates the dashboard "usage" text "Your usage as estimated by us based on your current supplier and house characteristics"
    And user validates the address "20a Preston Road, Littlemore, ee00ee"
    And user selects the "Edit details" button
    And user validates their personal details
      | Title              | Mr            |
      | Employment status  | Self Employed |
      | Residential status | Landlord      |
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: Prepayment user can edit their econ meter usage details, Preferences and Personal details and select the link for Prepayment meter
    Given user logs in as a "registered" user "elec econ pre","TestUser1","Login"
    And user validates the dashboard "usage" text "Your usage as estimated by us based on your current supplier and house characteristics"
    And user validates the address "2, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU"
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kwh" usage numbers "2222"
    And user enters their "Electric night kwh" usage numbers "5555"
    And user selects the "Save usage" button
    And user validates their "Electric day" usage number "2222 kWh"
    And user validates their "Electric night" usage number "5555 kWh"
    And user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings       | whd               |
      | Cheapest of the green tariffs | No Preference | I am not eligible |
    And user selects the "Save Preferences" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Miss           |
      | Firstname          | Gurdeep2-test  |
      | Lastname           | Kaur-test      |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user selects the "save details" button
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading
