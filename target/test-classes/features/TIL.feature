Feature: TIL -Results
  
  As an unregistered user I want to be able to view the TIL for the tariff that I am going to switch to

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

  @ready @smoketest
  Scenario: Switch now user viewing the TIL and switching to that tariff
    And user selects the more info link for a tariff
    And user selects the "TIL close" button
    And user selects the more info link for a tariff
    And user selects the "TIL back" button
    And user selects the more info link for a tariff
    And user selects the "Supplier T&CS" link
    Then user switches to the previous window
    And user selects the "TIL submit" button

  @ready @smoketest
  Scenario Outline: Delayed user viewing the TIL and switching to that tariff
    And user selects the more info link for a tariff
    And user selects the "TIL submit" button
    And user sees the "delayed" prompt
    And user selects the "<switch>" radio button
    Then user selects the "submit" button
    And user validates the page heading two "So we can send you your plan. You can use these details to update your preferences too."

    Examples: 
      | switch       |
      | switch now   |
      | switch later |

