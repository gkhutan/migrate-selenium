Feature: Register page
  
  As an unregistered user I want to be regiter with Migrate to switch to the deal I have chosen

  @ready @smoketest
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
    And user selects the "Gas" smart meter field to "yes"
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

  @ready @smoketest
  Scenario: I have a bill user with postcode bn126hu completing sign up with default values and viewing dashboard
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | SSE              |
      | dual tariff   | Standard         |
      | dual payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "That's ok - let's continue" button
    And user has entered their spend numbers "Electric spend","2000","Gas spend","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "yes"
    And user selects the supply address same as billing address field to "yes"
    And user selects the "Electric" smart meter field to "yes"
    And user selects the "Gas" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mr                                                              |
      | firstname          | Gurdeep                                                         |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | select address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status  | Self Employed                                                   |
      | residential status | Landlord                                                        |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    Then user validates the page heading two "Gurdeep, you're all set!"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user selects the "Log out" button
    And user validates the home page heading

  Scenario: User should not be able to submit the form if account holder name is less than 4 or more than 18 characters

  @ready @smoketest
  Scenario: If incorrect direct debits are entered then validation message appears
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user enters their details to register
      | form fields    | value |
      | account name   | Tes   |
      | account number | 55779 |
      | sort code      |   200 |
    Then user sees a list of validation messages
      | Account names must be between 4 and 18 characters long |
    And user enters their details to register
      | form fields    | value                   |
      | account name   | Testuser account holder |
      | account number |             12345678890 |
      | sort code      |                     200 |
    Then user sees a list of validation messages
      | Account names must be between 4 and 18 characters long |
      | Please provide a valid UK account number               |
    And user enters their details to register
      | form fields    | value        |
      | account name   | Test account |
      | account number |     01234567 |
      | sort code      |       999999 |
    Then user sees validation message for "direct debit" "Invalid account details provided."

  @ready @smoketest
  Scenario: If correct direct debits are entered then user sees confirmation details
    Given user logs in as a "returning" user "gurdeep+dec1@migrate.co.uk","TestUser1","Login"
    And user selects the "Continue" button
    And user enters their details to register
      | form fields    | value        |
      | account name   | Test account |
      | account number |     55779911 |
      | sort code      |       200000 |
    Then user validates the page text "Account Details"
    Then user validates the page text "Account Holders Name: Test account"
    Then user validates the page text "Sort Code: 200000"
    Then user validates the page text "Account Number: 55779911"
    Then user validates the page text "Name of Bank/Building society: Barclays Bank PLC"
    Then user validates the page text "Address of Bank/Building society: 1 Churchill Place, London"

  @ready @smoketest
  Scenario Outline: User should not be able to submit the form if DOB is not between 18 and 100
    Given user logs in as a "Returning" user "gurdeep+dec57@migrate.co.uk","TestUser1","Login"
    And user selects the "Continue" button
    And they enter a dob "0101 2003"
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
    Then user sees validation message "You must be over 18 to sign up to Migrate"
    And they enter a dob "<dob>"
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    Then user sees validation message for "dob" "<Validation message>"

    Examples: 
      | dob       | Validation message                                                                             |
      | 0101 1900 | Data Error: invalid date of birth - Applicants must be aged between 18 years and 100 years old |

  @ready
  Scenario: Validation messages appear on the register page if fields are left empty

  @ready
  Scenario: Toggling the enter address manually link displays validation messages if left empty

  @ready @smoketest
  Scenario: Validation message appears if T&C's have not been checked
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user selects the "Inactive sign up" button
    Then user sees a list of validation messages
      | Please select a title                                     |
      | Please enter a first name                                 |
      | Please enter a surname                                    |
      | Please enter a valid telephone number                     |
      | Please provide a date of birth                            |
      | Please select your address                                |
      | Please enter how long you resided at the provided address |
      | Please provide the postcode for this address              |
      | Please enter how long you resided at the provided address |
      | Please provide your employment status                     |
      | Please provide your residential status                    |
      | Please provide your billing postcode                      |
      | Please provide the name of the account holder             |
      | Please provide your account number                        |
      | Please provide your sort code                             |
    Then user selects the "enter your address manually" link
    And user selects the "Inactive sign up" button
    Then user sees a list of validation messages
      | Please select a title                                     |
      | Please enter a first name                                 |
      | Please enter a surname                                    |
      | Please enter a valid telephone number                     |
      | Please provide a date of birth                            |
      | Please provide your house/flat name or number             |
      | Please provide the first line of your address             |
      | Please enter how long you resided at the provided address |
      | Please provide the postcode for this address              |
      | Please enter how long you resided at the provided address |
      | Please provide your employment status                     |
      | Please provide your residential status                    |
      | Please provide your billing postcode                      |
      | Please provide your electric meter number                 |
      | Please provide your gas meter number                      |
      | Please provide the name of the account holder             |
      | Please provide your account number                        |
      | Please provide your sort code                             |
    Then user sees validation message for "T&CS" "You must agree to the terms and conditions to proceed."
    Then user selects the "select your address from the list" link

  @ready
  Scenario: Entering invalid data in the register form displays validation messages
    Given I am a new user type with known postcode "Welcome!","RH12 3GU","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    Then user selects the "enter your address manually" link
    And they enter a dob "19 "
    And user enters their details to register
      | form fields              | value               |
      | firstname                | G                   |
      | lastname                 | T                   |
      | Phone number             | 1 1                 |
      | gas meter number         |                1234 |
      | time at current address  |                  55 |
      | billing address postcode | bn1111              |
      | electric meter number    |                 134 |
      | title                    | Mr                  |
      | house no                 | Ditchlings          |
      | first line of address    | Manor Park, Preston |
      | employment status        | Self Employed       |
      | residential status       | Landlord            |
      | account name             | Test Account Name   |
      | account number           |            55779911 |
      | sort code                |              200000 |
    And user selects the "Inactive sign up" button
    Then user sees a list of validation messages
      | First name must be longer than 2 characters                    |
      | Surname must be longer than 2 characters                       |
      | Please enter a valid telephone number                          |
      | Please provide a valid date of birth                           |
      | Duration must be less than or equal to 35 months               |
      | Please enter a valid postcode                                  |
      | Your electric meter number must be 13 characters long          |
      | Your gas meter number must be between 9 and 10 characters long |

  @ready
  Scenario: Entering incorrect previous address data in the register form displays additional validation fields
    Given I am a new user type with known postcode "Welcome!","RH12 3GU","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    Then user selects the "enter your address manually" link
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields                      | value             |
      | title                            | Mr                |
      | firstname                        | Gurdeep           |
      | lastname                         | Test              |
      | Phone number                     |       01903249973 |
      | House no                         |                34 |
      | first line of address            | Towers Av         |
      | employment status                | Self Employed     |
      | residential status               | Landlord          |
      | account name                     | Test Account Name |
      | account number                   |          55779911 |
      | sort code                        |            200000 |
      | time at current address          |                 2 |
      | previous address postcode        | ee00ee            |
      | previous house no                |                   |
      | second address line1             |                   |
      | time at previous address         |                 2 |
      | second previous address postcode | ee00ee            |
      | third house no                   |                   |
      | third address line1              |                   |
      | billing address postcode         | ee00ee            |
      | billing house no                 |                   |
      | billing address line1            |                   |
      | gas meter number                 | ABCDEFGHIJKLM     |
      | electric meter number            | ABCDEFGHIJKLM     |
    And user selects the "Inactive Sign up" button
    Then user sees a list of validation messages
      | Please provide your previous house/flat name/number        |
      | Please provide the first line of your previous address     |
      | Please provide your previous house/flat name/number        |
      | Please provide your previous house/flat name/number        |
      | Please provide your billing address house/flat name/number |
      | Please provide line 1 of your billing address              |
      | Your electric meter number must be numeric                 |
      | Your gas meter number must be numeric                      |
