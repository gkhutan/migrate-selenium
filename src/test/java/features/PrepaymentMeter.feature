Feature: Prepayment Meter
  
  As an unregistered user I want to be able to select Prepayment meter as my payment type

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"

  @ready @smoketest
  Scenario: Selecting the Here link in the Prepayment prompt opens a new window
  Scenario: Selecting Prepayment should hide the supplier options on the results page and hide direct debit form on register
    And user selects the "same supplier yes" radio button
    And user selects a supplier and tariff and payment method
      | dual supplier | SSE              |
      | dual tariff   | Standard         |
      | dual payment  | Prepayment Meter |
    And user selects the "Continue" button
    And user selects the "here" link
    And user switches to the previous window
    And user selects the "That's ok - let's continue" button
    Then user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And the "supplier options" field is "not displayed"
    And user selects the "Continue" button
    Then when user creates an account
    And user validates the page heading two "Your switch is helping raise money for people who need it"
    And the "direct debit" field is "not displayed"

  @ready @smoketest
  Scenario: If user selects prepayment meter and non-prepayment meter as the payment method then validation message should appear
    And user selects the "same supplier no" radio button
    And user selects a supplier and tariff and payment method
      | supplier | SSE              |
      | tariff   | Standard         |
      | payment  | Prepayment Meter |
    And user sees validation message for "prepayment meter" "Sorry, we don't support customers with one prepayment tariff and one non-prepayment tariff."
