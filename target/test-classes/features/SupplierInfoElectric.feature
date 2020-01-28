Feature: Supplier Info Electric

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"

  @ready
  Scenario: Selecting Prepayment Payment method should display the Prepayment prompt
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | npower           |
      | elec tariff   | Standard         |
      | elec payment  | Prepayment Meter |
    And user selects the "Continue" button
    Then user sees the "Prepayment meter" prompt
    And user selects the "That's ok - let's continue" button
    Then user validates the page heading "What's your current usage?"

	
