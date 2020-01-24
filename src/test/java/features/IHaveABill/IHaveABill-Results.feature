Feature: Results - I have a bill to hand
  
 @ready
  Scenario Outline: Selecting the supplier options updates the metadata on the page accordingly
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
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
  Scenario: Switching to the estimator (I have a bill user) should display correct message on the results page
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    Given user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    When user selects the "Help me estimate" button
    When user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is |
      | 3 People          | Below average (professional couple) | Paper-thin       |
    Then user selects the "Usage" button
    Then user sees the route info message "As you don’t have your latest usage numbers, we estimated your usage with our usage calculator."
