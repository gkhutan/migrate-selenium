Feature: Contact us

  @ready @test
  Scenario Outline: Selecing the header links on contact us displays corressponding page
    Given user navigates to "Contact Us"
    And user selects the "<link>" link
    And user validates the page heading "<page title>"

    Examples: 
      | link         | page title           |
      | About us     | Our mission          |
      | Fuel Poverty | Fuel poverty         |
      | FAQs         | We're here to help   |
      | Contact us   | Contact us           |
      | Blog         | All you need to know |
      | Log in       | Login                |
