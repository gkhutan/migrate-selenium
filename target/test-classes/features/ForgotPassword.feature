Feature: Forgot Password

	@ready @smoketest
  Scenario: User can successfully enter their email to reset their password
    Given user navigates to "login"
    And user selects the "Cookie ok" button
    Given user is on the "login" page
    And user selects the "Forgot password" link
    And user enters their email "gurdeep+jan1@migrate.co.uk"
    And user selects the "Let's go" button
    And user sees validation message for "forgot password" "Your password reset link has been sent to gurdeep+jan1@migrate.co.uk"
