Feature: Energy Type
  
  As an unregistered user I want to be able to provide my energy type for my home so that I can obtain a quote for my energy

  Background: 
    Given I am a new user type with known postcode "Welcome!","BN126HU","No bill to hand","Let's go"
    Given user selects top nav icon "Energy"
    And user validates the page heading "What type of energy does your home use?"

  @test
  Scenario Outline: Selecting an energy type navigates user to the supplier info page
    When user selects "<energy type>" energy type
    And user selects the "Continue" button
    Then user validates the page heading "<heading>"

    Examples: 
      | energy type    | buttonState | heading                      |
      | Gas & Electric | active      | Who's your current supplier? |
      | Electric       | active      | Whos your current supplier? |
