Feature: Footer - Marketing pages

  @ready
  Scenario: User validates the footer links on the home page
    Given user navigates to "Home"
    Given user should see the footer with the following items
      | What is Migrate? footer |
      | Meet Migrate footer     |
      | T&CS footer             |
      | Privacy Policy footer   |
      | FAQS footer             |
      | Blog footer             |
      | Contact Us footer       |

  @ready
  Scenario Outline: Selecting the footer links displays the corressponding page
    Given user navigates to "Home"
    And user selects the "cookie privacy policy" link
    And user selects the "cookie OK" button
    And user selects the "<link>" link
    And user validates the page heading "<page title>"

    Examples: 
      | link                    | page title                 |
      | What is Migrate? footer | What is Migrate?           |
      | FAQS footer             | Frequently asked questions |
      | Blog footer             | All you need to know       |
      | Privacy Policy footer   | Privacy Policy             |
      | Meet Migrate footer     | Meet Migrate               |
      | T&Cs footer             | Our Terms and Conditions   |
      | Contact Us footer       | Migrate: Get in touch!     |

  @ready
  Scenario Outline: Selecting the social media footer links displays the corressponding page
    Given user navigates to "Home"
    And user selects the "cookie OK" button
    
    And user switches to the social media window "<link>","<page url>"

    Examples: 
      | link            | page url |
      | Facebook footer | Facebook |
      | Twitter footer  | Twitter  |
      | Linkedin footer | Linkedin |
