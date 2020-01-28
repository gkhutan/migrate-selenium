Feature: AWIN Sign up

  @ready
  Scenario: AWIN user can successfully sign up
    Given user navigates to "?awc=lookatthisitsanewreference_dontforgetthis"
    And user selects the "get started" button
    And user enters their postcode "BN12 6HU"
    And user selects the "cookie ok" button
    And user selects the "I have a bill to hand" type of user button
    And user selects the "Let's go" button
    Then user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | supplier | Brilliant Energy       |
      | tariff   | Standard Fair Deal     |
      | payment  | Quarterly Direct Debit |
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And user enters a new user email "gurdeep@migrate.co.uk"
    And user enters their password "TestUser1"
    And user enters their confirm password "TestUser1"
    And user selects the "Let's go" button
    And user is on the register page
    And user selects the "Electric" smart meter field to "yes"
    And user selects the "Gas" smart meter field to "yes"
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
    Then user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading
