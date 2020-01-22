Feature: Prepayment Meter - No bill to hand
  
  - As an unregistered user I want to be able to sign up successfully with my Prepayment meter

  Background: 

  @ready
  Scenario Outline: Prepayment Meter user can successfully sign up with a Prepayment meter - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "Econ meter yes" radio button
    And user selects a supplier and tariff and payment method
      | dual supplier | npower           |
      | dual payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "<Prepayment button>" button
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
      | firstname          | Gurdeep Test2                                                   |
      | lastname           | TestSurname                                                     |
      | Phone number       |                                                     01903242773 |
      | Select Address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | Employment Status  | Self Employed                                                   |
      | Residential Status | Landlord                                                        |
    And user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user validates the page text "Your usage as estimated by us based on your current supplier and house characteristics"
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type    | Prepayment radio     | Prepayment button          |
      | Gas & Electric | prepayment meter yes | That's ok - let's continue |

  @ready
  Scenario Outline: Prepayment Meter user can successfully sign up with a Prepayment meter - Electric
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | npower           |
      | elec payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "<Prepayment button>" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is     | My insulation is |
      | 1 Person          | Low user (second home) | Paper-thin       |
    And user selects the "Usage" button
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
    And user validates the page text "Your usage as estimated by us based on your current supplier and house characteristics"
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type | Prepayment radio     | Prepayment button          |
      | Electric    | prepayment meter yes | That's ok - let's continue |

  @ready
  Scenario: Prepayment meter and Economy meter user with separate suppliers can successfully sign up - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "Dual"
    And user selects the "same supplier no" radio button
    And user selects the "econ meter yes" radio button
    And user selects a supplier and tariff and payment method
      | supplier | npower           |
      | payment  | Prepayment Meter |
    And user selects the "Gas" button
    And user scrolls down
    And user selects a supplier and tariff and payment method
      | supplier | SSE              |
      | payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "That's ok - let's continue" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is                  | My insulation is          |
      | 5+ People         | Gas                  | Below average (professional couple) | Well-wrapped average home |
    Then user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
