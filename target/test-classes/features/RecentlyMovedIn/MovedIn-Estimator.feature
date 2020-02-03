Feature: Estimator - Moved in

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"

  @ready
  Scenario Outline: Selecting the options in the Estimator and Route info message should mention Recently moved in
    And user has selected an energy type "<Energy Type>"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user confirms the "Heating" field appears on the "Estimator" page
    When user selects the size of their home "<House size>"
    When user selects their estimated usage information
      | In my house lives   | My heating source is | My energy usage is  | My insulation is    |
      | <Estimator field 1> | <Estimator field 2>  | <Estimator field 3> | <Estimator field 4> |

    Examples: 
      | Energy Type    | House size | Estimator field 1 | Estimator field 2     | Estimator field 3                   | Estimator field 4         |
      | Gas & Electric | Large      | 5+ People         | Other                 | Below average (professional couple) | Paper-thin                |
      | Gas & Electric | Medium     | 1 Person          | Gas                   | Low user (second home)              | Airtight                  |
      | Gas & Electric | Small      | 2 People          | Economy 7 Electricity | Normal user (family house)          | Well-wrapped average home |
      | Electric       | Large      | 3 People          | Standard Electricity  | High user (we like it tropical)     | Paper-thin                |
      | Electric       | Medium     | 4 People          | Gas                   | Low user (second home)              | Airtight                  |
      | Electric       | Small      | 5 People          | Economy 7 Electricity | Below average (professional couple) | Well-wrapped average home |

  @ready
  Scenario: Selecting the estimator with Econ 7 values should display the additional heating field
    Given user has selected an energy type "Gas & Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user confirms the "Heating" field appears on the "Estimator" page
    When user selects the size of their home "large"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is     | My insulation is |
      | 1 Person          | Other                | Low user (second home) | Paper-thin       |
    Then user selects the "Usage" button
    Given user has selected an energy type "Electric"
    And user selects the "econ meter no" radio button
    And user selects the "Continue" button
    When user selects the size of their home "small"
    When user selects their estimated usage information
      | In my house lives | My energy usage is         | My insulation is          |
      | 5 People          | Normal user (family house) | Well-wrapped average home |
    Then user selects the "Usage" button

  @ready
  Scenario: Toggling between energy and supplier pages should remember the selection for the econ 7 meter
    And user has selected an energy type "Gas & Electric"
    And user selects the "econ meter no" radio button
    And user selects the "Continue" button
    And user selects top nav icon "supplier"
    And user confirms the radio is selected "econ meter no"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user confirms the "Heating" field appears on the "Estimator" page
    And user selects top nav icon "supplier"
    And user confirms the radio is selected "econ meter yes"
    And user selects the "Continue" button
    And user has selected an energy type "Electric"
    And user confirms the radio is selected "econ meter yes"
    And user selects the "Continue" button
    When user selects their estimated usage information
      | In my house lives | My heating source is  | My energy usage is              | My insulation is |
      | 4 People          | Economy 7 Electricity | High user (we like it tropical) | Paper-thin       |
    Then user selects the "Usage" button
    Then user sees the route info message "Because you’ve just moved in and are without an energy history for your property, we are presenting your savings to the default supplier and tariffs for your postcode. We estimated your usage with our usage calculator."
