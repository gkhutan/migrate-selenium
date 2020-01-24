Feature: Results - No bill to hand

  @ready
  Scenario Outline: Selecting the supplier options updates the lozenge, metadata and text on the page accordingly
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | British Gas            |
      | dual payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ People         | Below average (professional couple) | Well-wrapped average home |
    Then user selects the "Usage" button
    And user selects the "<supplier>" button
    And user selects the "<radio>" radio button
    And user validates the metadata field "<metadata>"
    Then there is at least one result displayed

    Examples: 
      | supplier     | radio         | metadata      |
      | All deals    | None          | None          |
      | Green energy | None          | Green Energy  |
      | None         | Ratings       | Top rated     |
      | None         | WHD           | WHD           |
      | None         | Paper Billing | Paper billing |
      | Green energy | Paper Billing | Paper billing |
      | Green energy | WHD           | WHD           |
      | Green energy | Ratings       | Top rated     |

  @ready
  Scenario: Results should display the correct route info text for No Bill to Hand routes (Start and Exit on I Dont Have a Bill)
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | British Gas            |
      | dual payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ People         | Below average (professional couple) | Well-wrapped average home |
    Then user selects the "Usage" button
    Then there is at least one result displayed
    Then user sees the route info message "As you don’t have a bill to hand, we’ve assumed you’re on your supplier’s standard tariff/s to present your savings. We estimated your usage with our usage calculator."

  @ready
  Scenario: Results should display the correct route info text for No Bill to Hand routes (Start on I Don't Have a Bill, Exit on I Have a Bill )
    Given I am a new user type with known postcode "Welcome!","bn126hu","No bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"
    When user selects a top six supplier "npower" icon
    And user selects the "Continue" button
    When user selects the "I know my numbers" button
    And user enters their "Electric kwh" usage numbers "2000"
    And user enters their "Gas kwh" usage numbers "5000"
    And user selects the "Usage" button
    Then user sees the route info message "As you don’t have a bill to hand, we’ve assumed you’re on your supplier’s standard tariff/s to present your savings."
