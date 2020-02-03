Feature: Economy 7 meter - No bill to hand

  @ready
  Scenario Outline: Economy 7 meter and Prepayment meter user can successfully Sign up and view and edit their details on the Dashboard - Electric only
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "<Energy Type>"
    And user selects a supplier and tariff and payment method
      | elec supplier | npower           |
      | elec payment  | Prepayment Meter |
    And user selects the "<Econ meter>" radio button
    And user selects the "Continue" button
    And user selects the "<Prepayment button>" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is     | My insulation is |
      | 1 Person          | Gas                  | Low user (second home) | Paper-thin       |
    Then user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mr                                                              |
      | firstname          | Gurdeep                                                         |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | Select Address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | Employment Status  | Self Employed                                                   |
      | Residential Status | Landlord                                                        |
    And user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kwh" usage numbers "2000"
    And user enters their "Electric night kwh" usage numbers "4000"
    And user selects the "Save usage" button
    And user validates their "Electric day" usage number "2000 kWh"
    And user validates their "Electric night" usage number "4000 kWh"
    And user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd           |
      | Cheapest of the green tariffs | 4+ Stars | I am eligible |
    And user selects the "Save preferences" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Mr       |
      | Firstname          | Gurdeep2 |
      | Lastname           | Kaur     |
      | Employment status  | Student  |
      | Residential status | Tenant   |
    And user selects the "save details" button
    And user selects the "prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type | Econ meter     | Prepayment button          |
      | Electric    | econ meter yes | That's ok - let's continue |

  @ready
  Scenario Outline: Economy 7 meter user can successfully sign up and view and edit their details on the Dashboard - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "<Energy Type>"
    And user selects a supplier and tariff and payment method
      | dual supplier | British Gas          |
      | dual payment  | Monthly Direct Debit |
    And user selects the "<Econ meter>" radio button
    And user selects the "Continue" button
    When user selects the size of their home "large"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is     | My insulation is |
      | 3 People          | Gas                  | Low user (second home) | Paper-thin       |
    Then user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mr                                                              |
      | firstname          | Gurdeep                                                         |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | Select Address     | 6, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | Employment Status  | Self Employed                                                   |
      | Residential Status | Landlord                                                        |
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    And user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kwh" usage numbers "2000"
    And user enters their "Electric night kwh" usage numbers "4000"
    And user enters their "Gas kwh" usage numbers "3333"
    And user selects the "Save usage" button
    And user validates their "Electric day" usage number "2000 kWh"
    And user validates their "Electric night" usage number "4000 kWh"
    And user validates their "Gas" usage number "3333 kWh"
    And user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd           |
      | Cheapest of the green tariffs | 4+ Stars | I am eligible |
    And user selects the "Save preferences" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Miss         |
      | Firstname          | Gurdeep-Test |
      | Lastname           | Kaur         |
      | Employment status  | Student      |
      | Residential status | Tenant       |
      | Account number     |     03745521 |
      | Sort code          |       090128 |
    And user selects the "save details" button
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type | Econ meter     |
      | Dual        | econ meter yes |
