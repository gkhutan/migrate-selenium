Feature: Create an account
  
  As a new user I want to be able to create an account successfully so that I can view my switch details at any time

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"

  @ready
  Scenario Outline: Creating an account successfully takes the user to the register page
    And user has selected an energy type "Gas & Electric"
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kWh","2000","Gas kWh","5000"
    And user selects the "Continue" button
    When user enters a new user email "<email>"
    And user enters their password "<password>"
    And user enters their confirm password "TestUser1"
    And user selects the "<button>" button
    Then user validates the page heading "<page text>"

    Examples: 
      | email                 | password  | page text                 | button            |
      | gurdeep@migrate.co.uk | TestUser1 | Migrate and do good       | Let's go          |
      | gurdeep@migrate.co.uk | TestUser2 | Let's make you an account | Inactive continue |

  @ready
  Scenario: Entering in incorrect email and password displays validation messages
    And user has selected an energy type "Gas & Electric"
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kWh","2000","Gas kWh","5000"
    And user selects the "Continue" button
    And user enters their email "None"
    And user enters their password " "
    And user enters their confirm password " "
    And user selects the "Inactive continue" button
    Then user sees a list of validation messages
      | Please enter a valid email address |
      | Please enter a valid password      |
      | Please re-enter your password      |
    And user enters their email "None"
    And user enters their password "1234 567"
    Then user sees a list of validation messages
      | Please enter a valid email address |
      | Password cannot contain whitespace |
      | Please re-enter your password      |
    And user enters their email "dual"
