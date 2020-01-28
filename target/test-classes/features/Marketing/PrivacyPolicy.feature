Feature: Privacy Policy


	@ready
  Scenario Outline: Selecting the footer links displays the corresponding page
    Given user navigates to "Home"
    And user selects the "cookie privacy policy" link
    And user selects the "privacy cookie ok" button
