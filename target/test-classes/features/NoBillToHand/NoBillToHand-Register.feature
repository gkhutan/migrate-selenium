Feature: Register - No bill to hand user

  @ready
  Scenario: No bill to hand user with unknown postcode EE00EE completing sign up with extra fields and viewing dashboard - Dual
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","No bill to hand","London","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | npower                 |
      | dual payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ People         | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "Electric" smart meter field to "yes"
    And user selects the "gas" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields                      | value                    |
      | title                            | Mr                       |
      | firstname                        | Gurdeep                  |
      | lastname                         | Test                     |
      | Phone number                     |              01903242773 |
      | house no                         | 20a                      |
      | first line of address            | Preston Road, Littlemore |
      | employment status                | Self Employed            |
      | residential status               | Landlord                 |
      | account name                     | Test Account Name        |
      | account number                   |                 55779911 |
      | sort code                        |                   200000 |
      | time at current address          |                        2 |
      | previous address postcode        | ee00ee                   |
      | previous house no                |                       10 |
      | second address line1             | Newman Road              |
      | time at previous address         |                        2 |
      | second previous address postcode | ee00ee                   |
      | third house no                   | 19a                      |
      | third address line1              | Oxford Road              |
      | billing address postcode         | ee00ee                   |
      | billing house no                 |                      123 |
      | billing address line1            | Brighton Road            |
      | electric meter number            |            1013092420412 |
      | gas meter number                 |               8822948210 |
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  Scenario: No bill to hand user with postcode BN12 6HU completing sign up with extra fields values and viewing dashboard - Dual
    Given I am a new user type with known postcode "Welcome!","BN12 6HU","No bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | npower                 |
      | dual payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ People         | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "Electric" smart meter field to "yes"
    And user selects the "gas" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields                      | value                                                           |
      | firstname                        | Gurdeep                                                         |
      | lastname                         | Test                                                            |
      | Phone number                     |                                                     01903242773 |
      | title                            | Mr                                                              |
      | select address                   | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status                | Self Employed                                                   |
      | residential status               | Landlord                                                        |
      | account name                     | Test Account Name                                               |
      | account number                   |                                                        55779911 |
      | sort code                        |                                                          200000 |
      | time at current address          |                                                               2 |
      | previous address postcode        | ee00ee                                                          |
      | previous house no                | 20a                                                             |
      | second address line1             | Preson Road                                                     |
      | time at previous address         |                                                               2 |
      | second previous address postcode | ee00ee                                                          |
      | third house no                   | 54 Chandlings                                                   |
      | third address line1              | Brighton Road                                                   |
      | billing address postcode         | ee00ee                                                          |
      | billing house no                 | 65A                                                             |
      | billing address line1            | Worthing lane                                                   |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  Scenario: No bill to hand user with unknown postcode EE00EE completing sign up with extra fields and viewing dashboard - Electric only
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","No bill to hand","London","Let's go"
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | npower                 |
      | elec payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ People         | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "Electric" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields                      | value                    |
      | title                            | Mr                       |
      | firstname                        | Gurdeep                  |
      | lastname                         | Test                     |
      | Phone number                     |              01903242773 |
      | house no                         | 20a                      |
      | first line of address            | Preston Road, Littlemore |
      | employment status                | Self Employed            |
      | residential status               | Landlord                 |
      | account name                     | Test Account Name        |
      | account number                   |                 55779911 |
      | sort code                        |                   200000 |
      | time at current address          |                        2 |
      | previous address postcode        | ee00ee                   |
      | previous house no                |                       10 |
      | second address line1             | Newman Road              |
      | time at previous address         |                        2 |
      | second previous address postcode | ee00ee                   |
      | third house no                   | 19a                      |
      | third address line1              | Oxford Road              |
      | billing address postcode         | ee00ee                   |
      | billing house no                 |                      123 |
      | billing address line1            | Brighton Road            |
      | electric meter number            |            1013092420412 |
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: No bill to hand user with postcode BN12 6HU completing sign up with extra fields values and viewing dashboard  - Electric only
    Given I am a new user type with known postcode "Welcome!","BN12 6HU","No bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | npower                 |
      | elec payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ People         | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "Electric" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields                      | value                                                           |
      | firstname                        | Gurdeep                                                         |
      | lastname                         | Test                                                            |
      | Phone number                     |                                                     01903242773 |
      | title                            | Mr                                                              |
      | select address                   | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status                | Self Employed                                                   |
      | residential status               | Landlord                                                        |
      | account name                     | Test Account Name                                               |
      | account number                   |                                                        55779911 |
      | sort code                        |                                                          200000 |
      | time at current address          |                                                               2 |
      | previous address postcode        | ee00ee                                                          |
      | previous house no                | 20a                                                             |
      | second address line1             | Preson Road                                                     |
      | time at previous address         |                                                               2 |
      | second previous address postcode | ee00ee                                                          |
      | third house no                   | 54 Chandlings                                                   |
      | third address line1              | Brighton Road                                                   |
      | billing address postcode         | ee00ee                                                          |
      | billing house no                 | 65A                                                             |
      | billing address line1            | Worthing lane                                                   |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading
