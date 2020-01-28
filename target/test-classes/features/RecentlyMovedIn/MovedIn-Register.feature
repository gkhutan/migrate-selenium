Feature: Register - Recently Moved In
	
	@ready @smoketest
  Scenario: Recently Moved In with unknown postcode EE00EE completing sign up with extra fields and viewing dashboard - Dual
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","Recently Moved In","London","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 2 People          | Below average (professional couple) | Well-wrapped average home |
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

	@ready
  Scenario: Recently Moved In user with postcode BN12 6HU completing sign up with extra fields values and viewing dashboard - Dual
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user has selected an energy type "Gas & Electric"
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

	@ready
  Scenario: Recently Moved In user with unknown postcode EE00EE completing sign up with extra fields and viewing dashboard - Electric only
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","Recently Moved In","London","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 2 People          | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
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
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

	@ready @smoketest
  Scenario: Recently Moved In user with postcode BN12 6HU completing sign up with extra fields values and viewing dashboard  - Electric only
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 2 People          | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
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

  @ready @test
  Scenario: A returning user starts again in the same session with an unknown postcode and successfully sign up and view dashboard
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 2 People          | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user scrolls down
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Given a returning user wants to start again with a unknown postcode "Welcome back!","ee00ee","Recently moved in","London","Let's go","What type of energy does your home use?"
    And user has selected an energy type "Electric"
    And user selects the "econ meter no" radio button
    And user selects the "prepayment meter no" radio button
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is         | My insulation is |
      | 5 People          | Normal user (family house) | Paper-thin       |
    And user selects the "Usage" button
    And user selects the "Green energy" button
    And user selects the "Continue" button
    And user is on the register page
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields           | value                    |
      | title                 | Mrs                      |
      | firstname             | Gurdeep                  |
      | lastname              | Test                     |
      | Phone number          |              01903242773 |
      | house no              | 20a                      |
      | first line of address | Preston Road, Littlemore |
      | employment status     | Self Employed            |
      | residential status    | Landlord                 |
      | electric meter number |            1013092420412 |
      | account name          | Test Account Name        |
      | account number        |                 55779911 |
      | sort code             |                   200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading
