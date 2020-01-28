Feature: Results - Recently moved in

  @ready @smoketest
  Scenario Outline: Results should display the correct route info text for Recently Moved In routes (Start on I Just Moved in but press the Pre Payment button)
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

  @ready @smoketest
  Scenario Outline: Results should display the correct route info text for Recently Moved In routes (Start and Exit on I Just Moved In)
    Given I am a new user type with known postcode "Welcome!","bn126hu","<User>","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "Continue" button
    When user selects the size of their home "medium"
    When user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is                  | My insulation is          |
      | 2 People          | Standard Electricity | Below average (professional couple) | Well-wrapped average home |
    Then user selects the "Usage" button
    Then user sees the route info message "<Message>"

    Examples: 
      | Route                             | User              | Message                                                                                                                                                                                                                    |
      | Start and Exit on I Just Moved In | Recently Moved In | Because you’ve just moved in and are without an energy history for your property, we are presenting your savings to the default supplier and tariffs for your postcode. We estimated your usage with our usage calculator. |
