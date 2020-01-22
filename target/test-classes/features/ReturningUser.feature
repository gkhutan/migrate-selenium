Feature: Returning user

  Background: 

  @ready
  Scenario Outline: Selecting the start again button for a retruning user takes the user to the returning users sign up page
    Given user logs in as a "returning" user "returning","TestUser1","Login"
    And user selects top nav icon "<Icon>"
    And user validates the page heading "<Title>"
    And user scrolls down
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Then user validates the page heading "Welcome back!"

    Examples: 
      | Icon     | Title                                   |
      | Switch   | Choose your first switch                |
      | Usage    | What's your current usage?              |
      | Supplier | Who's your current supplier?            |
      | Energy   | What type of energy does your home use? |
