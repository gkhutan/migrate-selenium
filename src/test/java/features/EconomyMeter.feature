Feature: Economy Meter 7

  @ready
  Scenario: Entering incorrect usage numbes for kWh displays validation messages - dual kWh
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user selects the "Help me estimate" button
    And user selects the "I know my numbers" button
    And user enters their "electric day kWh" usage numbers manually "-1"
    And user enters their "electric night kWh" usage numbers manually "-2"
    And user enters their "gas kWh" usage numbers manually "-3"
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Your day electricity usage must be a valid number   |
      | Your night electricity usage must be a valid number |
      | Your gas usage must be a valid number               |
    And user enters their "electric day kWh" usage numbers manually "1"
    And user enters their "electric night kWh" usage numbers manually "2"
    And user enters their "gas kWh" usage numbers manually "3"
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Your day electricity usage must be greater than 10   |
      | Your night electricity usage must be greater than 10 |
      | Your gas usage must be greater than 10               |
    And user enters their "electric day kwh" usage numbers manually "999999"
    And user enters their "electric night kwh" usage numbers manually "999999"
    And user enters their "gas kwh" usage numbers manually "999999"
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Your day electricity usage must be less than 999998   |
      | Your night electricity usage must be less than 999998 |
      | Your gas usage must be less than 999998               |
    And user enters their "electric day kwh" usage numbers manually "2000"
    And user enters their "electric night kwh" usage numbers manually "3000"
    And user enters their "gas kwh" usage numbers manually "4000"
    And user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Entering incorrect usage numbes for spend displays validation messages - dual spend
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user selects the "Help me estimate" button
    And user selects the "I know my numbers" button
    And user selects the "I Spend Elec" radio button
    And user selects the "I Spend Gas" radio button
    And user enters their "electric spend" usage numbers manually "-1"
    And user enters their "gas spend" usage numbers manually "-3"
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Your electricity spend must be a valid number |
      | Your gas spend must be a valid number         |
    And user enters their "electric spend" usage numbers manually " "
    And user enters their "gas spend" usage numbers manually " "
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Please provide your electricity spendage |
      | Please provide your gas spendage         |
    And user enters their "electric spend" usage numbers manually "999999"
    And user enters their "gas spend" usage numbers manually "999999"
    And user selects the "Inactive continue" button
    And user sees a list of validation messages
      | Your electricity spend must be less than 50000 |
      | Your gas spend must be less than 50000         |
    And user enters their "electric spend" usage numbers manually "3000"
    And user enters their "gas spend" usage numbers manually "3000"
    And user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
