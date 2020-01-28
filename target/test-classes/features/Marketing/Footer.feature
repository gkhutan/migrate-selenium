Feature: Footer - Marketing pages

  @ready
  Scenario: User validates the footer links on the home page
    Given user navigates to "Home"
    Given user should see the footer with the following items
      | About us footer       |
      | Fuel Poverty footer   |
      | FAQS footer           |
      | Contact Us footer     |
      | T&CS footer           |
      | Privacy Policy footer |

  @todo @smoketest
  Scenario Outline: Selecting the footer links displays the corresponding page
    Given user navigates to "Home"
    And user selects the "privacy cookie OK" button
    And user selects the "<link>" link
    And user validates the page heading "<page title>"

    Examples: 
      | link                  | page title               |
      | About us footer       | Our mission              |
      | fuel poverty footer   | Fuel poverty             |
      | FAQs footer           | We're here to help       |
      | Contact Us footer     | Contact us               |
      | T&Cs footer           | Our Terms and Conditions |
      | Privacy Policy footer | Privacy Policy           |

  @ready 
  Scenario Outline: Selecting the social media footer links displays the corresponding page
    Given user navigates to "Home"
    And user selects the "privacy cookie OK" button
    And user switches to the social media window "<link>","<page url>"

    Examples: 
      | link            | page url |
      | Facebook footer | Facebook |
      | Twitter footer  | Twitter  |
      #| Linkedin footer | Linkedin |
