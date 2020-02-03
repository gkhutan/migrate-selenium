Feature: Finish your sign up
  
  As a new user I want to be able to go back and complete my journey so that I can obtain a quote

  @ready
  Scenario Outline: A returning user is navigated to the previous page they visited and can log out successfully
    Given user logs in as a "returning" user "returning","TestUser1","Login"
    And user is on the funnel "<Page>" page
    And user validates the page heading "<Title>"
    When user selects the "Home" button
    Then user is navigated to the "" page
    Then user sees the "Finish your sign up" button
    When user selects the "Finish your sign up" button
    And user validates the page heading "<Title>"
    When user selects the "Home" button
    And user selects the "Logout" link

    Examples: 
      | Page     | Title                                   |
      | Switch   | Choose your first switch                |
      | Usage    | What's your current usage?              |
      | Supplier | Who's your current supplier?            |
      | Energy   | What type of energy does your home use? |

  @ready
  Scenario: Selecting the Finish your sign up button takes the returning user to the previous page they visited
    Given user logs in as a "returning" user "returning","TestUser1","Login"
    And user selects top nav icon "Switch"
    And user has selected the "Finish your sign up" button "signup/results","Finish your sign up","Finish your sign up"
    And user selects top nav icon "Usage"
    And user has selected the "Finish your sign up" button "signup/usage","Finish your sign up","Finish your sign up"
    And user selects top nav icon "Supplier"
    And user has selected the "Finish your sign up" button "signup/supplier-info","Finish your sign up","Finish your sign up"
    And user selects top nav icon "Energy"
    And user has selected the "Finish your sign up" button "signup/energy-type","Finish your sign up","Finish your sign up"

  @ready
  Scenario: Selecting the Finish your sign up button takes the new user to the previous page they visited
    Given I am a new user type with unknown postcode "Welcome!","ee00ee","I have a bill to hand","London","Let's go"
    And user has selected the "Finish your sign up" button "signup/energy-type","Finish your sign up","Finish your sign up"
    And user has selected an energy type "Electric"
    And user has selected the "Finish your sign up" button "signup/supplier-info","Finish your sign up","Finish your sign up"
    And user has selected their default energy supplier information
    And user has selected the "Finish your sign up" button "signup/usage","Finish your sign up","Finish your sign up"
    And user has entered their electric usage number "1000"
    And user has selected the "Finish your sign up" button "signup/results","Finish your sign up","Finish your sign up"
