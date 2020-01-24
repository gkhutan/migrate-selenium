Feature: Login
  
  As a new user I want to be able to login successfully
  
  @ready @smoketest
  Scenario: Logging in successfully as a returning user
    Given user logs in as a "Returning" user "returning","TestUser1","Login"
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario Outline: User should be navigated to the correct page when entering their credentials
    Given user navigates to "login"
    And user validates the "Migrate: Login" page title
    Then user selects the "cookie ok" button
    When user enters their email "<email>"
    And user enters their password "<password>"
    And user selects the "login" button
    And user validates the "<url>" URL

    Examples: 
      | email                | password   | url            |
      | dual                 | TestUser1  | dashboard      |
      | returning            | TestUser1  | signup/results |
      | gurdeep@zzzzzzzz.com | TestUser10 | login          |

  @ready
  Scenario Outline: Logging in with incorrect credentials should show validation message
    Given user navigates to "login"
    And user validates the "Migrate: Login" page title
    Then user selects the "cookie ok" button
    When user enters their email "<email>"
    And user enters their password "<password>"
    And user selects the "login" button
    And user validates the "<page title>" page title
    And user sees validation message "Error: Incorrect email/password combination. Please try again or click on forgot your password"

    Examples: 
      | email                 | password   | page title     |
      | gurdeep@zzzzzzzz.com  | Testuser10 | Migrate: Login |
      | gurdeep@migrate.co.uk | zzzzzzzzzz | Migrate: Login |
