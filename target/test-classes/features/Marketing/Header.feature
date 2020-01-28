Feature: Header - Marketing pages

  @ready 
  Scenario: User sees the header items
    Given user navigates to "Home"
    Given user should see the header with the following items
      | Our mission |
      | Help        |
      | Blog        |
      | Log in      |

  @ready @smoketest
  Scenario Outline: Selecting the header links displays corresponding page
    Given user navigates to "Home"
     And user selects the "<Header>" link
    And user selects the "<link>" link
    And user validates the page heading "<page title>"

    Examples: 
      | Header      | link         | page title           |
      | Our mission | About us     | Our mission          |
      | Our mission | Fuel Poverty | Fuel poverty         |
      | Help        | FAQs         | We're here to help   |
      | Help        | Contact us   | Contact us           |
      | Blog        | None         | All you need to know |
      | Log in      | None         | Login                |


