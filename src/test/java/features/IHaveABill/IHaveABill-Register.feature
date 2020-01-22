Feature: Register - I have a bill to hand

  @ready
  Scenario: I have a bill user with unknown postcode EE00EE completing sign up with extra fields and viewing dashboard - Dual
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","I have a bill to hand","London","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "electric" smart meter field to "yes"
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
    Then user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: I have a bill user with postcode BN12 6HU completing sign up with extra fields values and viewing dashboard - Dual
    Given I am a new user type with known postcode "Welcome!","BN12 6HU","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "All deals" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "Electric" smart meter field to "yes"
    And user selects the "Gas" smart meter field to "yes"
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
    Then user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: I have a bill user with unknown postcode EE00EE completing sign up with extra fields and viewing dashboard - Electric only
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","I have a bill to hand","London","Let's go"
    And user has selected an energy type "Electric"
    And user has selected their default energy supplier information
    And user has entered their electric usage number "2000"
    And user selects the "Green energy" button
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
    Then user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: I have a bill user with postcode BN12 6HU completing sign up with extra fields values and viewing dashboard  - Electric only
    Given I am a new user type with known postcode "Welcome!","BN12 6HU","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user has selected their default energy supplier information
    And user has entered their electric usage number "2000"
    And user selects the "Green energy" button
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
    Then user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: I have a bill user with postcode bn126hu completing sign up with default values and viewing dashboard
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "yes"
    And user selects the supply address same as billing address field to "yes"
    And user selects the "Electric" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mrs                                                             |
      | firstname          | Gurdeep                                                         |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | select address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status  | Self Employed                                                   |
      | residential status | Landlord                                                        |
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    Then user validates the page heading two "Gurdeep, you're all set!"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: I have a bill user with postcode ee00ee completing sign up with default values and viewing dashboard
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","I have a bill to hand","London","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "yes"
    And user selects the supply address same as billing address field to "yes"
    And user selects the "Electric" smart meter field to "yes"
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
    Then user validates the page heading two "Gurdeep, you're all set!"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario Outline: User should not be able to submit the form if account holder name is less than 4 or more than 18 characters
    Given I am a new user type with known postcode "Welcome!","BN12 6HU","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user has selected their default energy supplier information
    And user has entered their electric usage number "2000"
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
      | account name       | <Test Account Name>                                             |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    Then user selects the "T&CS" radio button
    And user selects the "<Sign up>" button
    Then user sees validation message "<Validation message>"
    And user validates the "<url>" URL

    Examples: 
      | Test Account Name       | Validation message                                     | Sign up          | url             |
      | Tes                     | Account names must be between 4 and 18 characters long | Inactive Sign up | signup/register |
      | Testuser account holder | Account names must be between 4 and 18 characters long | Inactive Sign up | signup/register |
      | Test user               | None                                                   | Sign up          | dashboard       |
