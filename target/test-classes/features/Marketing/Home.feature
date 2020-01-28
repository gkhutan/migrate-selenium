Feature: Home - Marketing page

  @ready
  Scenario Outline: Selecing the links on the home page displays corressponding page
    Given user navigates to "Home"
    And user selects the "privacy cookie OK" button
    And user selects the "<button>" button
    And user validates the page heading "<page title>"

    Examples: 
      | button              | page title         |
      | Get Started         | Welcome!           |
      | Let's get started 1 | Welcome!           |
      | Let's get started 2 | Welcome!           |
      #| See all FAQs        | We're here to help |
