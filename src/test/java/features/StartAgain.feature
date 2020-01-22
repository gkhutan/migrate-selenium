Feature: Start Again
  
  As an unregistered user I want to be able to start again so that I can start a new journey through the funnel

  @ready
  Scenario: Selecting the start again button for a new user takes the user to the new user sign up page
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user selects "Electric" energy type
    And user has selected "confirm" in the start again prompt "Start again","Confirm","Welcome!"
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Continue" button
    And user has selected "confirm" in the start again prompt "Start again","Confirm","Welcome!"
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Continue" button
    And user enters their "Electric kwh" usage numbers "2000"
    And user has selected "confirm" in the start again prompt "Start again","Confirm","Welcome!"

  @ready
  Scenario Outline: Selecting the start again button for a retruning user takes the user to the returning users sign up page
    Given user logs in as a "returning" user "gurdeep+dec1@migrate.co.uk","TestUser1","Login"
    And user selects top nav icon "<Icon>"
    And user validates the page heading "<Title>"
    And user scrolls down
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Then user validates the page heading "Welcome back!"

    Examples: 
      | Icon     | Title                                   |
      | Switch   | Choose your first switch                |
      | Usage    | What's your current usage?             |
      | Supplier | Who's your current supplier?            |
      | Energy   | What type of energy does your home use? |

  @ready
  Scenario Outline: Selecting cancel in the start again dialog closes the dialog and user remains on the same page
    Given user logs in as a "returning" user "gurdeep+dec1@migrate.co.uk","TestUser1","Login"
    And user selects top nav icon "<Icon>"
    And user validates the page heading "<Title>"
    And user scrolls down
    When user selects the "Start again" button
    And user selects "cancel" in the start again prompt
    And user validates the page heading "<Title>"

    Examples: 
      | Icon     | Title                                   |
      | Switch   | Choose your first switch                |
      | Usage    | What's your current usage?              |
      | Supplier | Who's your current supplier?            |
      | Energy   | What type of energy does your home use? |

  @ready
  Scenario: Selecting the Start again button on the Register page, takes the user to the returning users sign up page
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Continue" button
    And user has entered their electric usage number "2000"
    And user selects the "Continue" button
    And when user creates an account
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Then user validates the page heading "Welcome back!"

  @ready
  Scenario: Start again button on the Create an account page for a new user takes the user to the sign up page
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Electric"
    And user selects the "Continue" button
    And user has entered their electric usage number "2000"
    And user selects the "Continue" button
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user validates the page heading "Welcome!"

  @ready
  Scenario: A returning user can start again and successfully navigate back into the funnel
    Given user logs in as a "returning" user "gurdeep+dec1@migrate.co.uk","TestUser1","Login"
    And user scrolls down
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Then user validates the page heading "Welcome back!"
    When user enters their postcode "bn12 6hu"
    And user selects the "Recently moved in" type of user button
    And user selects the "Let's go" button
    And user validates the page heading "What type of energy does your home use?"

  @ready
  Scenario: A returning user can start again with a known postcode and successfully navigate back into the funnel
    Given user logs in as a "returning" user "gurdeep+rec@migrate.co.uk","TestUser1","Login"
    And user scrolls down
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Given a returning user wants to start again with a known postcode "Welcome back!","BN12 6HU","Recently moved in","Let's go","What type of energy does your home use?"

  @ready
  Scenario: A returning user can start again with an unknown postcode and successfully navigate back into the funnel
    Given user logs in as a "returning" user "gurdeep+rec@migrate.co.uk","TestUser1","Login"
    And user scrolls down
    When user selects the "Start again" button
    And user selects "confirm" in the start again prompt
    Then user is navigated to the returning users sign up page
    Given a returning user wants to start again with a unknown postcode "Welcome back!","ee00ee","Recently moved in","London","Let's go","What type of energy does your home use?"
