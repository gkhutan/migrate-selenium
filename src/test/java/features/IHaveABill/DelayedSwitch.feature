Feature: Delayed switch
  
  - As an unregistered user I want to be able to switch now although I will incur an exit fee
  - As an unregistered user I want to be able to switch later without incurring an exit fee

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"
    And user validates the page heading "Who's your current supplier?"
    When user selects a supplier and tariff and payment method
      | dual supplier | SSE                    |
      | dual tariff   | 1 Year Fixed v16       |
      | dual payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kWh","1234","Gas kWh","1234"

  @ready
  Scenario Outline: User switching now and incurring an exit fee and viewing switch now dashboard / user switching later and seeing delayed dashboard
    And user selects the "Continue" button
    And user sees the "delayed" prompt
    And user selects the "close prompt" button
    And user selects the "Continue" button
    And user selects the "<switch>" radio button
    Then user selects the "submit" button
    And when user creates an account
    And user is on the register page
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
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user validates the "dashboard" URL
    Then user validates the page heading two "<page heading>"
    And validates the text in the "<popup>" congrats popup "<page text>"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user sees the "<dashboard>" user dashboard
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | switch       | page heading             | popup      | page text                               | dashboard |
      | switch now   | Gurdeep, you're all set! | switch now | Your energy switch reference number is: | switched  |
      | switch later | Congratulations Gurdeep! | delayed    |                                         | delayed   |

  @bug
  Scenario Outline: DOB validation checks for a Delayed and Switch now user on the Register page
    And user selects the "Paper billing" radio button
    And user selects the "Continue" button
    And user sees the "delayed" prompt
    And user selects the "<switch>" radio button
    Then user selects the "submit" button
    And when user creates an account
    And user is on the register page
    And they enter a dob "<dob1>"
    And user enters their details to register
      | form fields         | value                                                           |
      | title               | Mr                                                              |
      | firstname           | Gurdeep                                                         |
      | lastname            | Test                                                            |
      | Phone number        |                                                     07702684900 |
      | select address      | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status   | Self Employed                                                   |
      | residential status  | Landlord                                                        |
      | paper billing comms | Text/SMS                                                        |
      | account name        | Test Account Name                                               |
      | account number      |                                                        55779911 |
      | sort code           |                                                          200000 |
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    Then user sees validation message for "dob" "<Validation message>"
    And user validates the page heading "Migrate and do good"
    And user selects the "home" button
    And user should see the header with the following items
      | Our mission         |
      | Help                |
      | Blog                |
      | Logout              |
      | Finish your sign up |
    And user selects the "Finish your sign up" button
    And they enter a dob "<dob2>"
    And user enters their details to register
      | form fields         | value    |
      | paper billing comms | Text/SMS |
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | switch       | dob1      | dob2      | Validation message                                                                             |
      | switch now   | 0101 1900 | 0101 2000 | Data Error: invalid date of birth - Applicants must be aged between 18 years and 100 years old |
      | switch later | 0101 1900 | 0101 1980 | Data Error: invalid date of birth - Applicants must be aged between 18 years and 100 years old |
