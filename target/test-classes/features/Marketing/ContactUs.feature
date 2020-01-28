Feature: Contact us

  @ready
  Scenario Outline: Selecing the header links on contact us displays corresponding page
    Given user navigates to "Contact-Us"
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
