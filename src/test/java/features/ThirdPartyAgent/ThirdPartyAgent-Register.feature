Feature: Register - Third Party Agent

  Background: 
    And user logs in as a "registered" user "gurdeep+whhp@migrate.co.uk","TestUser1","Login"
    And user has added a known address "Add an address","BN4 3JJ","I have a bill to hand","Adding another address to your account?","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"


  @ready
  Scenario: Third party option is displayed for agent council users on the register page
  Scenario: If the Third party option is not selected a validation message is displayed and user can not submit form on the register page
    Given user has selected "Paper billing" option
        And user selects the "Continue" button
    And user is on the register page
    And user should see the following fields
      | Paper billing comms |
      | PSR                 |
      | Third party t&cs    |
    And user selects the lived for three years field to "yes"
    And user selects the supply address same as billing address field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields           | value                     |
      | title                 | Mr                        |
      | firstname             | Gurdeep3                  |
      | lastname              | Test                      |
      | Phone number          |               01903243554 |
      | house no              |                       999 |
      | first line of address | North Lane Road, Brighton |
      | employment status     | Self Employed             |
      | residential status    | Landlord                  |
      | account name          | Test Account Name         |
      | account number        |                  55779911 |
      | sort code             |                    200000 |
      | paper billing comms   | Paper Correspondence      |
      | psr                   | Blind                     |
      | electric meter number |             1013092420412 |
      | gas meter number      |                8822948210 |
    Then user selects the "T&CS" radio button
    And user selects the "Inactive Sign up" button
    And user sees validation message for "agent t&cs" "You must agree to the terms and conditions to proceed."
    And user selects the "third party t&cs" radio button
     And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user selects the "Log out" button
    And user validates the home page heading
