Feature: Prepayament meter - Recently moved in
  
  - As an unregistered user I want to be able to sign up successfully with my Prepayment meter

  @ready
  Scenario Outline: User can successfully sign up with a Economy 7 meter and a Prepayment meter - Dual and Electric
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user has selected an energy type "<Energy Type>"
    And user selects the "<Prepayment radio>" radio button
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
    And user validates the dashboard "usage" text "Your usage as estimated by us based on the most common tariff in your specific area and your new home's characteristics"
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Energy Type    | Prepayment radio     | Prepayment button          |
      | Gas & Electric | prepayment meter yes | That's ok - let's continue |
      | Electric       | prepayment meter yes | That's ok - let's continue |
