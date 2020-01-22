Feature: Variable tariff

  @ready
  Scenario: Selecting the variable tariff threshold saves the amount selected
    Given user logs in as a "registered" user "elec econ pre","TestUser1","Login"
    And user selects a threshold amount
      | Threshold | £100 |
    And user selects the "Log out" button
    Given user logs in as a "registered" user "elec econ pre","TestUser1","Login"
    And user validates the threshold amount "£100"

  @todo
  Scenario: Fixed tariff uses should not see the threshold field
	@todo
  Scenario Outline: Selecting the variable tariff displays the threshold field
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently moved in","Let's go"
    And user validates the page heading "What type of energy does your home use?"
    And user has selected an energy type "Electric"
    And user selects the "prepayment meter yes" radio button
    And user selects the "Continue" button
    And user selects the "That's ok - let's continue" button
    And user selects their estimated usage information
      | In my house lives | My insulation is | My energy usage is     |
      | 1 Person          | Paper-thin       | Low user (second home) |
    And user selects the "Usage" button
    And user selects a tariff "<tariff>"
    And when user creates an account
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mrs                                                             |
      | firstname          | GurdeepTest                                                     |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | select address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status  | Self Employed                                                   |
      | residential status | Landlord                                                        |
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And the threshold field is "<displayed>"
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | tariff                       | displayed     |
      | Super Saver November 2020 B4 | not displayed |
      | Pioneer                      | displayed     |

  @todo
  Scenario Outline: Delayed tariff users should not see the threshold field
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user validates the page heading "What type of energy does your home use?"
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | Brilliant Energy       |
      | elec tariff   | Standard Fair Deal     |
      | elec payment  | Quarterly Direct Debit |
    And user selects the "Continue" button
    When user enters their "Electric kwh" usage numbers "2000"
    And user selects the "Usage" button
    And user selects a tariff "<tariff>"
    And user selects the "switch later" radio button
    And when user creates an account
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                            |
      | title              | Mrs                                                              |
      | firstname          | GurdeepTest                                                      |
      | lastname           | Test                                                             |
      | Phone number       |                                                      01903242773 |
      | select address     | 56, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status  | Self Employed                                                    |
      | residential status | Landlord                                                         |
      | account name       | Test Account Name                                                |
      | account number     |                                                         55779911 |
      | sort code          |                                                           200000 |
    Then user selects the "t&cs" button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And the threshold field is "<displayed>"
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | tariff  | displayed     |
      | Pioneer | not displayed |
