Feature: Contact us

	@ready
  Scenario Outline: Selecing the header links on contact us displays corressponding page
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
