Feature: Prepayment Meter - I have a bill to hand
  
  - As an unregistered user I want to be able to sign up successfully with my Prepayment meter

  @ready
  Scenario Outline: Prepayment Meter user can successfully sign up with a Prepayment meter - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user selects "<Energy Type>" energy type
    And user selects the "Continue" button
    And user selects a supplier and tariff and payment method
      | dual supplier | npower           |
      | dual tariff   | Standard         |
      | dual payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "<Prepayment button>" button
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And the "supplier options" field is "not displayed"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mr                                                              |
      | firstname          | Gurdeep                                                         |
      | lastname           | TestSurname                                                     |
      | Phone number       |                                                     01903242773 |
      | Select Address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | Employment Status  | Self Employed                                                   |
      | Residential Status | Landlord                                                        |
    And user selects the "t&cs" radio button
    And user selects the "Sign up" button
    Then user validates the page heading two "Gurdeep, you're all set!"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user validates the page text "Your usage as provided by you through the Kwh usage details on your latest bill"
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type    | Prepayment radio     | Prepayment button          |
      | Gas & Electric | prepayment meter yes | That's ok - let's continue |

  @ready
  Scenario Outline: Prepayment Meter user can successfully sign up with a Prepayment meter - Electric
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user selects "<Energy Type>" energy type
    And user selects the "Continue" button
    And user selects a supplier and tariff and payment method
      | elec supplier | npower           |
      | elec tariff   | Standard         |
      | elec payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "<Prepayment button>" button
    And user enters their "Electric kwh" usage numbers "2000"
    And user selects the "Usage" button
    And the "supplier options" field is "not displayed"
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
    Then user validates the page heading two "Gurdeep, you're all set!"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user validates the page text "Your usage as provided by you through the Kwh usage details on your latest bill"
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type | Prepayment radio     | Prepayment button          |
      | Electric    | prepayment meter yes | That's ok - let's continue |

  @ready
  Scenario: Prepayment meter and Economy meter user with separate suppliers can successfully view results - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Dual"
    And user selects the "same supplier no" radio button
    And user selects the "econ meter yes" radio button
    And user selects a supplier and tariff and payment method
      | supplier | British Gas      |
      | tariff   | Standard         |
      | payment  | Prepayment Meter |
    And user selects the "Gas" button
    And user scrolls down
    And user selects a supplier and tariff and payment method
      | supplier | Avid Energy      |
      | tariff   | Smart PAYG       |
      | payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "That's ok - let's continue" button
    And user enters their "gas kwh" usage numbers "3333"
    And user has entered their usage numbers "Electric day kwh","2000","Electric night kwh","5000"
    And the "supplier options" field is "not displayed"
