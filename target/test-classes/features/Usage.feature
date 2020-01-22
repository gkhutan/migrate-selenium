Feature: Usage info
  
  As an unregistered user I want to be able to enter my usage numbers

  Background: 

  @ready
  Scenario: Entering usage numbers kWh for dual suppliers and then entering numbers for separate suppliers successfully - kWh
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | Brilliant Energy       |
      | dual tariff   | Standard Fair Deal     |
      | dual payment  | Quarterly Direct Debit |
    And user selects the "Continue" button
    When user enters their "Electric kWh" usage numbers "5000"
    And user enters their "Gas kWh" usage numbers "2000"
    When user selects the "Usage" button
    And user selects top nav icon "Supplier"
    And user selects the "same supplier no" radio button
    And user selects a supplier and tariff and payment method
      | supplier | ScottishPower          |
      | tariff   | Basic Energy           |
      | payment  | Pay On Receipt Of Bill |
    And user selects the "Gas" button
    And user scrolls down
    And user selects a supplier and tariff and payment method
      | supplier | Co-op Energy                        |
      | tariff   | Co-op Safe and Secure Paper Billing |
      | payment  | Pay On Receipt Of Bill              |
    And user selects the "Continue" button
    When user enters their "Electric kWh" usage numbers "1233"
    And user enters their "Gas kWh" usage numbers "5432"
    When user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Entering usage numbers kWh for dual and Economy meter usage fields successfully - kWh & Spend
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | Brilliant Energy       |
      | dual tariff   | Standard Fair Deal     |
      | dual payment  | Quarterly Direct Debit |
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user validates the page text "What's your current usage?"
    When user enters their "Electric day kWh" usage numbers "5000"
    And user enters their "Electric night kWh" usage numbers "2000"
    And user enters their "Gas kWh" usage numbers "2030"
    When user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
    And user selects top nav icon "Usage"
    And user validates the page text "What's your current usage?"
    And user selects the "I Spend Elec" radio button
    And user selects the "I Spend Gas" radio button
    When user enters their "Electric spend" usage numbers "4000"
    And user enters their "Gas spend" usage numbers "5555"
    When user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Entering usage numbers for Electric and Economy meter usage fields successfully - kWh & Spend
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | npower               |
      | elec tariff   | Standard             |
      | elec payment  | Monthly Direct Debit |
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user validates the page text "What's your current usage?"
    When user enters their "Electric day kWh" usage numbers "5000"
    And user enters their "Electric night kWh" usage numbers "2000"
    When user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
    And user selects top nav icon "Usage"
    And user validates the page text "What's your current usage?"
    And user selects the "I Spend Elec" radio button
    When user enters their "Electric spend" usage numbers "4000"
    When user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Entering incorrect usage numbes displays validation messages -  elec kWh
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects a supplier and tariff and payment method
      | elec supplier | British Gas            |
      | elec tariff   | Standard               |
      | elec payment  | Quarterly Direct Debit |
    And user selects the "econ meter no" radio button
    And user selects the "Continue" button
    And user enters their "Electric kWh" usage numbers "-1"
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Your electricity usage must be a valid number |
    And user enters their "Electric kWh" usage numbers "1"
    And user sees a list of validation messages
      | Your electricity usage must be greater than 10 |
    And user enters their "Electric kWh" usage numbers "12345678"
    And user sees a list of validation messages
      | Your electricity usage must be less than 999998 |
    And user enters their "Electric kWh" usage numbers "2222"
    And user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
	
	@ready
  Scenario: Selecting a frequency successfully - kWh and Spend
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user selects "Gas & Electric" energy type
    And user selects the "Continue" button
    And user selects the "same supplier no" radio button
    And user selects a supplier and tariff and payment method
      | supplier | Brilliant Energy       |
      | tariff   | Standard Fair Deal     |
      | payment  | Quarterly Direct Debit |
    And user selects the "Gas" button
    And user scrolls down
    And user selects a supplier and tariff and payment method
      | supplier | Co-op Energy                        |
      | tariff   | Co-op Safe and Secure Paper Billing |
      | payment  | Pay On Receipt Of Bill              |
    And user selects the "Continue" button
    And user enters their "electric kWh" usage numbers "330"
    And user selects the "electric" frequency to "Quarterly"
    And user enters their "gas kWh" usage numbers "220"
    And user selects the "gas" frequency to "Monthly"
    And user selects the "I Spend Elec" radio button
    And user enters their "electric spend" usage numbers "440"
    And user selects the "electric spend" frequency to "Annually"
    And user selects the "I Spend Gas" radio button
    And user enters their "gas spend" usage numbers "550"
    And user selects the "gas spend" frequency to "Quarterly"
    And user selects top nav icon "Supplier"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user selects the "I use Elec" radio button
    And user enters their "electric day kWh" usage numbers "660"
    And user enters their "electric night kWh" usage numbers "770"
    And user selects the "I Spend Elec" radio button
    And user enters their "electric spend" usage numbers "880"
    And user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
