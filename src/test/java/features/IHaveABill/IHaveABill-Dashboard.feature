Feature: Dashboard - I have a bill

  @ready
  Scenario: The correct tariff, Preferences, Personal details, address are shown on the dashboard
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","I have a bill to hand","London","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    When user enters their "Electric kwh" usage numbers manually "5000"
    And user enters their "gas kwh" usage numbers manually "2000"
    When user selects the "Usage" button
    And user selects the "Green energy" button
    And user selects the "ratings" radio button
    And user selects the "whd" radio button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
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
      | gas meter number      |               8822948210 |
      | account name          | Test Account Name        |
      | account number        |                 55779911 |
      | sort code             |                   200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Edit Preferences" button
    And user validates the preferences dialog values
      | switch preference             | ratings  | whd           |
      | Cheapest of the green tariffs | 4+ Stars | I am eligible |
    And user selects the "Save Preferences" button
    And user validates their "Electric" usage number "5000 kWh"
    And user validates their "Gas" usage number "2000 kWh"
    And user validates the dashboard "usage" text "Your usage as provided by you through the Kwh usage details on your latest bill"
    And user validates the address "20a, Preston Road, Littlemore, ee00ee"
    And user selects the "Edit details" button
    And user validates their personal details
      | Title              | Mr            |
      | Employment status  | Self Employed |
      | Residential status | Landlord      |
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: Toggling the address link to enter address manually displays correct address on dashboard
    Given I am a new user type with known postcode "Welcome!","BN126HU","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    When user enters their "Electric kwh" usage numbers "5230"
    And user enters their "gas kwh" usage numbers "4440"
    When user selects the "Usage" button
    And user selects the "Green energy" button
    And user selects the "ratings" radio button
    And user selects the "whd" radio button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
    Then user selects the "enter your address manually" link
    And user enters their details to register
      | form fields           | value                         |
      | title                 | Miss                          |
      | firstname             | Gurdeep7                      |
      | lastname              | Test-test                     |
      | Phone number          |                   01903929334 |
      | house no              |                           100 |
      | first line of address | Vallum Place, Village Heights |
      | employment status     | Self Employed                 |
      | residential status    | Landlord                      |
      | electric meter number |                 1013092420412 |
      | gas meter number      |                    8822948210 |
      | account name          | Test Account Name             |
      | account number        |                      55779911 |
      | sort code             |                        200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user validates the address "100, Vallum Place, Village Heights, BN126HU"
    And user selects the "Log out" button
    And user validates the home page heading

  @ready 
  Scenario: Toggling the address link to select an address from the list displays correct address on dashboard
    Given I am a new user type with known postcode "Welcome!","OX43UJ","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    When user enters their "Electric kwh" usage numbers "5230"
    And user enters their "gas kwh" usage numbers "4440"
    When user selects the "Usage" button
    And user selects the "Green energy" button
    And user selects the "ratings" radio button
    And user selects the "whd" radio button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
    Then user selects the "enter your address manually" link
    Then user selects the "select your address from the list" link
    And user enters their details to register
      | form fields        | value                                        |
      | title              | Miss                                         |
      | firstname          | Gurdeep7                                     |
      | lastname           | Test-test                                    |
      | Phone number       |                                  01903929334 |
      | select address     | 4, Newman Road, OXFORD, Oxfordshire, OX4 3UJ |
      | employment status  | Self Employed                                |
      | residential status | Landlord                                     |
      | account name       | Test Account Name                            |
      | account number     |                                     55779911 |
      | sort code          |                                       200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user validates the address "4, Newman Road, OXFORD, Oxfordshire, OX4 3UJ"
    And user selects the "Log out" button
    And user validates the home page heading

  @ready 
  Scenario: User can edit their econ meter usage details, Preferences and Personal details and select the link for Prepayment meter
    Given user logs in as a "registered" user "elec econ pre","TestUser1","Login"
    And user validates the address "2, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU"
    Given user selects the "Edit Usage" button
    And user selects the "close dialog" button
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kwh" usage numbers manually "2222"
    And user enters their "Electric night kwh" usage numbers manually "5555"
    And user selects the "Save usage" button
    And user validates their "Electric day" usage number "2222 kWh"
    And user validates their "Electric night" usage number "5555 kWh"
    And user selects the "Edit preferences" button
    And user selects the "close dialog" button
    Given user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd               |
      | Cheapest of the green tariffs | 4+ Stars | I am not eligible |
    And user selects the "Save Preferences" button
    Given user selects the "Edit preferences" button
    And user validates their preferences on the dashboard
      | switch preference             | ratings  | whd               |
      | Cheapest of the green tariffs | 4+ Stars | I am not eligible |
    And user selects the "Save Preferences" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Mr             |
      | Firstname          | Gurdeep2       |
      | Lastname           | Kaur           |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user selects the "save details" button
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading
