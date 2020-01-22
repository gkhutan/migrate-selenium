Feature: Home - Marketing page

  @ready
  Scenario Outline: Selecing the links on the home page displays corressponding page
    Given user navigates to "Home"
    And user selects the "cookie OK" button
    And user selects the "<button>" button
    And user validates the page heading "<page title>"

    Examples: 
      | button                   | page title                  |
      | Get Started              | Migrate to a cheaper future |
      | Start Saving             | Migrate to a cheaper future |
      | Sounds great, Sign Me Up | Migrate to a cheaper future |
