Feature: Economy 7 meter - I have a bill

  @ready
  Scenario Outline: Economy 7 meter and Prepayment meter user can successfully Sign up and view and edit their details on the Dashboard - Prepayment, Econ 7 & Electric
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user selects "<Energy Type>" energy type
    And user selects the "Continue" button
    And user selects a supplier and tariff and payment method
      | elec supplier | npower           |
      | elec tariff   | Standard         |
      | elec payment  | Prepayment Meter |
    And user selects the "<Econ meter>" radio button
    And user selects the "Continue" button
    And user selects the "<Prepayment button>" button
    And user has entered their usage numbers "<ElecDayUsage>","<DayUsage>","<ElecNightUsage>","<NightUsage>"
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
    And user enters their "<ElecDayUsage>" usage numbers "2222"
    And user enters their "<ElecNightUsage>" usage numbers "5555"
    And user selects the "Save usage" button
    And user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd           |
      | Cheapest of the green tariffs | 4+ Stars | I am eligible |
    And user selects the "Save Preferences" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Mr       |
      | Firstname          | Gurdeep2 |
      | Lastname           | Kaur     |
      | Employment status  | Student  |
      | Residential status | Tenant   |
    And user selects the "save details" button
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type | Econ meter     | Prepayment button          | ElecDayUsage     | DayUsage | ElecNightUsage     | NightUsage |
      | Electric    | econ meter yes | That's ok - let's continue | Electric day kwh |     2000 | Electric night kwh |       4000 |

  @ready
  Scenario Outline: Economy 7 meter user can successfully sign up and view and edit their details on the Dashboard - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "<Energy Type>"
    And user selects the "<Econ meter>" radio button
    And user has selected their default energy supplier information
    And user enters their "<GasUsageField>" usage numbers "<GasUsage>"
    And user has entered their usage numbers "<ElecDayUsage>","<DayUsage>","<ElecNightUsage>","<NightUsage>"
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
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    And user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    Given user selects the "Edit Usage" button
    And user enters their "<ElecDayUsage>" usage numbers "<DayUsage2>"
    And user enters their "<ElecNightUsage>" usage numbers "<NightUsage2>"
    And user enters their "<GasUsageField>" usage numbers "<GasUsage2>"
    And user selects the "Save usage" button
    And user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd           |
      | Cheapest of the green tariffs | 4+ Stars | I am eligible |
    And user selects the "Save Preferences" button
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
      | Energy Type | Econ meter     | ElecDayUsage     | DayUsage | DayUsage2          | ElecNightUsage | NightUsage | NightUsage2 | GasUsageField | GasUsage2 |
      | Dual        | econ meter yes | Electric day kwh |     2000 | Electric night kwh |           4000 |       4333 | Gas kwh     |          3000 |      6353 |
