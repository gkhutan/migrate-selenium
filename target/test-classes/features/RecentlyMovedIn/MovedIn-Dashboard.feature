Feature: Dashboard - Recently Moved In

  @ready
  Scenario: The correct Address, Preferences, Personal details are shown on the dashboard - recently moved in
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "prepayment meter no" radio button
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is                  | My insulation is          |
      | 5+ People         | Gas                  | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "whd" radio button
    And user selects the "ratings" radio button
    And user selects the "Green energy" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | firstname          | Gurdeep                                                         |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | title              | Mr                                                              |
      | select address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status  | Self Employed                                                   |
      | residential status | Landlord                                                        |
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Edit Preferences" button
    And user validates the preferences dialog values
      | switch preference             | ratings  | whd           |
      | Cheapest of the green tariffs | 4+ Stars | I am eligible |
    And user selects the "Save Preferences" button
    And user validates the dashboard "usage" text "Your usage as estimated by us based on the most common tariff in your specific area and your new home's characteristics"
    And user validates the address "4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU"
    And user selects the "Edit details" button
    And user validates their personal details
      | Title              | Mr            |
      | Employment status  | Self Employed |
      | Residential status | Landlord      |
    And user selects the "save details" button
    And user selects the "Log out" button
    And user validates the home page heading

  @ready 
  Scenario: Prepayment user can edit their econ meter usage details, Preferences and Personal details and select the link for Prepayment meter
    Given user logs in as a "registered" user "elec econ","TestUser1","Login"
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kwh" usage numbers "2222"
    And user enters their "Electric night kwh" usage numbers "5555"
    And user selects the "close dialog" button
    And user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings       | whd               |
      | Cheapest of the green tariffs | No Preference | I am not eligible |
    And user selects the "close dialog" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Miss           |
      | Firstname          | Gurdeep2-test  |
      | Lastname           | Kaur-test      |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user selects the "cancel" button
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading
