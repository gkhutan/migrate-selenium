Feature: Results - Recently moved in

  @ready
  Scenario Outline: Selecting the supplier options updates the lozenge, metadata on the page accordingly
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My heating source is  | My energy usage is     | My insulation is |
      | 5 People          | Economy 7 Electricity | Low user (second home) | Paper-thin       |
    And user selects the "Usage" button
    And user selects the "<supplier>" button
    And user confirms the radio is selected "<radio>"
    And user validates the metadata field "<metadata>"

    Examples: 
      | supplier     | radio         | metadata      |
      | Green energy | Paper Billing | Paper billing |
      | Green energy | WHD           | WHD           |
      | Green energy | Ratings       | Top rated     |

  @ready
  Scenario Outline: Results should display the route info text
    Given I am a new user type with known postcode "Welcome!","bn126hu","Recently Moved In","Let's go"
    And user selects "Electric" energy type
    And user selects the "Continue" button
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives   | My heating source is   | My energy usage is   | My insulation is   |
      | <In my house lives> | <My heating source is> | <My energy usage is> | <My insulation is> |
    Then user selects the "Usage" button
    Then user sees the route info message "Because you’ve just moved in and are without an energy history for your property, we are presenting your savings to the default supplier and tariffs for your postcode. We estimated your usage with our usage calculator."

    Examples: 
      | In my house lives | My heating source is | My energy usage is                  | My insulation is          |
      | 5 People          | Standard Electricity | Below average (professional couple) | Well-wrapped average home |
