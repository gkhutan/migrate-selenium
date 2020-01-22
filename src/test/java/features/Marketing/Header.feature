Feature: Header - Marketing pages

  @ready
  Scenario: User sees the header items
    Given user navigates to "Home"
    Given user should see the header with the following items
      | What is Migrate? |
      | FAQS             |
      | Blog             |
      | Sign Up          |
      | Login            |

  @ready
  Scenario Outline: Selecting the header links displays corressponding page
    Given user navigates to "Home"
    And user selects the "<link>" link
    And user validates the page heading "<page title>"

    Examples: 
      | link             | page title                  |
      | What is Migrate? | What is Migrate?            |
      | FAQS             | Frequently asked questions  |
      | Blog             | All you need to know        |
      | Sign Up          | Migrate to a cheaper future |
      | Login            | Login                       |

  Scenario Outline: Selecing the header links displays corressponding page
    Given user navigates to "Contact Us"
    And user selects the "<link>" link
    And user validates the page heading "<page title>"

    Examples: 
      | link             | page title                  |
      | What is Migrate? | What is Migrate?            |
      | FAQS             | Frequently asked questions  |
      | Blog             | All you need to know        |
      | Sign Up          | Migrate to a cheaper future |
      | Login            | Login                       |
