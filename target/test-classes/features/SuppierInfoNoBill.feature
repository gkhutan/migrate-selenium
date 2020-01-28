Feature: Supplier Info - No bill to hand
  
  - As an unregistered user I want to be able to see separate energy suppliers so that I can choose my suppliers individually

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"

  @ready @smoketest
  Scenario: Selecting My Payment Method is not shown option will display the Missing payment Type prompt
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | npower                         |
      | dual payment  | My payment method is not shown |
    Then user sees the "Missing Payment Type" prompt
    And user selects the "missing payment type" button
    And user sees the "I have a bill to hand" supplier page
