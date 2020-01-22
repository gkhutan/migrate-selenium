Feature: Supplier Info
  
  - As an unregistered user I want to be able to see separate energy suppliers so that I can choose my suppliers individually

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"

  @ready
  Scenario: Deselecting the checkbox 'I have same suppliers..' shows both gas and electric fields
    And user has selected an energy type "Gas & Electric"
    And user validates the page heading "Who's your current supplier?"
    When user selects the "same supplier no" radio button
    And user validates the supplier "electric" fields are displayed
    And user selects the "Gas" button
    And user validates the supplier "gas" fields are displayed
    When user selects the "same supplier yes" radio button
    And user validates the page heading "Who's your current supplier?"
    And user validates the supplier "dual" fields are displayed

  @ready
  Scenario: Selecting separate Gas and Electric suppliers should display these values as selected
    And user has selected an energy type "Gas & Electric"
    And user validates the page heading "Who's your current supplier?"
    And user selects the "Continue" button
    Then user selects top nav icon "supplier"
    And user selects the "same supplier no" radio button
    And user validates the supplier "electric" fields are displayed
    And user selects the "Gas" button
    And user validates the supplier "gas" fields are displayed
    And user selects the "same supplier yes" radio button
    And user validates the supplier "dual" fields are displayed

  @ready
  Scenario Outline: Selecting the top six suppliers displays the value in the supplier dropdown field - dual and not same supplier
    And user has selected an energy type "Gas & Electric"
    And user validates the page heading "Who's your current supplier?"
    And user validates the supplier "dual" fields are displayed
    When user selects a top six supplier "<supplier>" icon
    Then the top six supplier appears selected "<supplier>"
 
    When user selects the "same supplier no" radio button
    And user validates the supplier "electric" fields are displayed
    When user selects a top six supplier "<supplier>" icon
    Then the top six supplier appears selected "<supplier>"
    And user selects the "Gas" button
    And user validates the supplier "gas" fields are displayed
    When user selects a top six supplier "<supplier>" icon
    Then the top six supplier appears selected "<supplier>"
    And user selects the "same supplier yes" radio button
    And user validates the page heading "Who's your current supplier?"

    Examples: 
      | supplier      | energy gas   | energy elec   | energy dual   |
      | npower        | gas supplier | elec supplier | dual supplier |
      | E.ON          | gas supplier | elec supplier | dual supplier |
      | ScottishPower | gas supplier | elec supplier | dual supplier |
      | EDF Energy    | gas supplier | elec supplier | dual supplier |
      | SSE           | gas supplier | elec supplier | dual supplier |
      | British Gas   | gas supplier | elec supplier | dual supplier |

  @ready
  Scenario Outline: Selecting the top six suppliers displays the value in the supplier dropdown field - Electric
    And user has selected an energy type "Electric"
    And user validates the supplier "electric" fields are displayed
    When user selects a top six supplier "<supplier>" icon
    Then the top six supplier appears selected "<supplier>"
    And the supplier dropdown "<energy elec>" displays value "<supplier>"

    Examples: 
      | supplier      | energy elec   |
      | npower        | elec supplier |
      | E.ON          | elec supplier |
      | ScottishPower | elec supplier |
      | EDF Energy    | elec supplier |
      | SSE           | elec supplier |
      | British Gas   | elec supplier |

  @ready
  Scenario Outline: Navigating between dual and electric and same supplier checkbox displays the correct page
    And user has selected an energy type "Electric"
    And user validates the supplier "electric" fields are displayed
    When user selects a top six supplier "<supplier>" icon
    Then the top six supplier appears selected "<supplier>"
    And user selects the "Continue" button
    Then user has selected an energy type "Gas & Electric"
    Then user validates the page heading "Who's your current supplier?"
    And user selects the "same supplier no" radio button
    And user selects the "Gas" button
    And user validates the supplier "gas" fields are displayed
    Then user has selected an energy type "Electric"
    When user selects a top six supplier "<supplier>" icon
    Then the top six supplier appears selected "<supplier>"

    Examples: 
      | supplier | energy elec   |
      | npower   | elec supplier |
