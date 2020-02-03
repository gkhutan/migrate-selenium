Feature: Dashboard
  
  As an unregistered user I want to be regiter with Migrate to switch to the deal I have chosen

  @ready @smoketest
  Scenario: User can edit their Econ meter, Usage details, Preferences and Personal details
    Given user logs in as a "registered" user "dual econ","TestUser1","Login"
    Given user selects the "Edit Usage" button
    And user selects the "close dialog" button
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kWh" usage numbers manually "2222"
    And user enters their "Electric night kWh" usage numbers manually "5555"
    And user enters their "Gas kWh" usage numbers manually "3333"
    And user selects the "Save usage" button
    And user validates their "Electric day" usage number "2222 kWh"
    And user validates their "Electric night" usage number "5555 kWh"
    And user validates their "Gas" usage number "3333 kWh"
    And user selects the "Edit preferences" button
    And user selects the "close dialog" button
    Given user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd               |
      | Cheapest of the green tariffs | 4+ Stars | I am not eligible |
    And user selects the "Save Preferences" button
    Given user selects the "Edit preferences" button
    And user validates the preferences dialog values
      | switch preference             | ratings  | whd               |
      | Cheapest of the green tariffs | 4+ Stars | I am not eligible |
    And user selects the "Save Preferences" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Mr             |
      | Firstname          | Gurdeep2       |
      | Lastname           | Kaur           |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user selects the "save details" button
    And user selects the "Edit details" button
    And user validates their personal details
      | Title              | Mr             |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user selects the "Cancel" button
    And user selects the "Log out" button
    And user validates the home page heading

  @ready @smoketest
  Scenario Outline: The user's address is displayed on the dashboard
    Given user logs in as a "registered" user "<Email>","TestUser1","Login"
    And user validates the address "<address>"

    Examples: 
      | Email                | address                                                         |
      | elec                 | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | test unknown address | test name, test address, sw14pa                                 |

  @ready
  Scenario: Entering usage numbers and personal details incorrecly displays validation messages - dual, econ 7
    Given user logs in as a "registered" user "dual econ","TestUser1","Login"
    Given user selects the "Edit Usage" button
    And user enters their "Electric day kwh" usage numbers manually " "
    And user enters their "Electric night kwh" usage numbers manually " "
    And user enters their "Gas kwh" usage numbers manually " "
    And user selects the "inactive save usage" button
    Then user sees a list of validation messages
      | Please provide your new electricity usage |
      | Please provide your new electricity usage |
      | Please provide your new gas usage         |
    And user enters their "Electric day kwh" usage numbers manually "abcd"
    And user enters their "Electric night kwh" usage numbers manually "abcd"
    And user enters their "gas kwh" usage numbers manually "abcd"
    Then user sees a list of validation messages
      | Your electricity usage must be a number |
      | Your electricity usage must be a number |
      | Your gas usage must be a number         |
    And user enters their "Electric day kwh" usage numbers manually "123344445444"
    And user enters their "Electric night kwh" usage numbers manually "123344445444"
    And user enters their "Gas kwh" usage numbers manually "123344445444"
    Then user sees a list of validation messages
      | Your electricity usage must be less than 999998 |
      | Your electricity usage must be less than 999998 |
      | Your gas usage must be less than 999998         |
    And user selects the "close dialog" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Miss           |
      | Firstname          | ' '            |
      | Lastname           | ' '            |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user sees a list of validation messages
      | Please enter a first name |
      | Please enter a surname    |
    And user selects the "cancel" button
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: Editing usage numbers and personal details incorrecly displays validation messages - elec
    Given user logs in as a "registered" user "elec","TestUser1","Login"
    Given user selects the "Edit Usage" button
    And user enters their "Electric kwh" usage numbers manually " "
    And user selects the "Inactive save usage" button
    And user sees validation message "Please provide your new electricity usage"
    And user enters their "Electric kwh" usage numbers manually "abcd"
    And user selects the "Inactive save usage" button
    And user sees validation message "Your electricity usage must be a number"
    And user selects the "close dialog" button
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Title              | Miss           |
      | Firstname          | ' '            |
      | Lastname           | ' '            |
      | Employment status  | Student        |
      | Residential status | Property Owner |
    And user selects the "Inactive save details" button
    And user sees a list of validation messages
      | Please enter a first name |
      | Please enter a surname    |
    And user selects the "cancel details" button
    And user selects the "Prepayment contact us" link
    And user selects the "Dashboard" link
    And user selects the "Log out" button
    And user validates the home page heading

  @ready
  Scenario: The correct tariff name and savings are displayed on the dashboard
    Given user logs in as a "registered" user "dashboard user","TestUser1","Login"
    And user validates the dashboard "usage" text "Your usage as provided by you through the Kwh usage details on your latest bill"
    And user validates the savings cost "£89.89"
    And user validates the tariff name "Go Green (1 Year) v23"

  @ready @smoketest
  Scenario: Selecting the social media icons navigates user to the correct social media page
    Given user logs in as a "registered" user "dashboard user","TestUser1","Login"
    And user selects the "Facebook" link
    And user switches to the new window "facebook icon"
    And user selects the "Whats app" link
    And user switches to the new window "whats app icon"
    And user selects the "Twitter" link
    And user switches to the new window "twitter icon"
    And user selects the "Log out" button
    And user validates the home page heading

  @ready @smoketest
  Scenario: User can navigate back to the dashboard successfully
    Given user logs in as a "registered" user "dashboard user","TestUser1","Login"
    And user selects the "home" button
    Then user selects the "Dashboard" link
    Then user validates the "dashboard" URL

  @ready
  Scenario: Editing bank account numbers incorrecly displays validation messages
    Given user logs in as a "registered" user "dashboard user","TestUser1","Login"
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Sort code      | ' ' |
      | Account number | ' ' |
    And user selects the "inactive save details" button
    And user sees a list of validation messages
      | Please provide your account number |
      | Please provide your sort code      |
    And user edits their personal details on the dashboard
      | Account number | 12345678 |
      | Sort code      |   111111 |
    And user selects the "save details" button
    And user sees validation message "Invalid UK bank account detected"
    And user selects the "Log out" button
    And user validates the home page heading

  @ready @smoketest
  Scenario: Editing bank account numbers successfully
    Given user logs in as a "registered" user "dashboard user","TestUser1","Login"
    And user selects the "Edit details" button
    And user edits their personal details on the dashboard
      | Account number | 03745521 |
      | Sort code      |   090128 |
    And user selects the "save details" button
    And the "save details" button is "not displayed"
    And user selects the "Log out" button
    And user validates the home page heading
