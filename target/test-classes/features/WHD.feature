Feature: WHD

  @ready @smoketest
  Scenario Outline: Selecting the WHD options updates the metadata and text on the page accordingly
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user selects a supplier and tariff and payment method
      | dual supplier | Brilliant Energy       |
      | dual tariff   | Standard Fair Deal     |
      | dual payment  | Quarterly Direct Debit |
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kWh","2000","Gas kWh","5000"
    And user selects the "<whd>" radio button
    And user confirms the radio is selected "<radio>"
    And user validates the metadata field "<metadata>"

    Examples: 
      | whd | radio | metadata |
      | WHD | WHD   | WHD      |

  @ready
  Scenario: User can edit their WHD preference on the dashboard
    Given user logs in as a "registered" user "dual","TestUser1","Login"
    Given user selects the "Edit preferences" button
    And user edits their preferences on the dashboard
      | switch preference             | ratings  | whd               |
      | Cheapest of the green tariffs | 4+ Stars | I am not eligible |
    And user selects the "Save Preferences" button
    Given user selects the "Edit preferences" button
    And user validates the WHD preference is "I am not eligible"
    And user edits their preferences on the dashboard
      | switch preference         | ratings       | whd           |
      | Cheapest of any suppliers | No Preference | I am eligible |
    And user selects the "Save Preferences" button
    Given user selects the "Edit preferences" button
    And user validates the WHD preference is "I am eligible"
    Given user selects the "Save preferences" button
    And user selects the "log out" button
