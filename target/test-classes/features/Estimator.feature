Feature: Estimator

  Background: 

  @ready
  Scenario: Selecting the estimator values should display the fields as selected
    Given I am a new user type with known postcode "Welcome!","BN126HU","No bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"
    When user selects a top six supplier "ScottishPower" icon
    And user selects the "Continue" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 2 People          | Below average (professional couple) | Well-wrapped average home |
    Then user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Selecting the estimator with Econ 7 values should display the additional heating field
    Given I am a new user type with known postcode "Welcome!","BN126HU","No bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"
    When user selects a top six supplier "sse" icon
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    When user selects the size of their home "large"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is     | My insulation is |
      | 1 Person          | Gas                  | Low user (second home) | Paper-thin       |
    Then user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Toggling between estimator and I know my numbers should remember the selection for the econ meter
    Given I am a new user type with known postcode "Welcome!","BN126HU","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user confirms the radio is selected "econ meter no"
    And user selects the "Continue" button
    And user enters their "Gas kWh" usage numbers "2000"
    And user enters their "Electric kWh" usage numbers "2000"
    When user selects the "Help me estimate" button
    And user selects top nav icon "supplier"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user confirms the "Heating" field appears on the "Estimator" page
    When user selects the "I know my numbers" button
    And user has selected an energy type "Electric"
    When user selects a top six supplier "npower" icon
    And user confirms the radio is selected "econ meter yes"
    And user selects the "Continue" button
    And user enters their "Electric day kWh" usage numbers "2000"
    And user enters their "Electric night kWh" usage numbers "3000"
    Then user selects the "Usage" button
    And user validates the page heading "Choose your first switch"

  @ready
  Scenario: Selecting the estimator should keep user in I don't have a bill mode on the results page
    Given I am a new user type with known postcode "Welcome!","BN126HU","No bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"
    When user selects a top six supplier "npower" icon
    And user selects the "Continue" button
    When user selects the "I know my numbers" button
    And user enters their "Electric kWh" usage numbers "2000"
    And user enters their "Gas kWh" usage numbers "5000"
    And user selects the "Usage" button
    And user validates the page heading "Choose your first switch"
    Then user sees the route info message "As you don’t have a bill to hand, we’ve assumed you’re on your supplier’s standard tariff/s to present your savings."
