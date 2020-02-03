Feature: Paper billing

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"

  @ready
  Scenario Outline: Selecting paper billing should display the selection in the paper billing drop down
    And user selects the "<paper billing>" radio button
    And user confirms the radio is selected "<radio>"
    And user validates the metadata field "<metadata>"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user should see the following fields
      | Paper billing comms |
    And user enters their details to register
      | form fields         | value                  |
      | paper billing comms | <paper billing option> |
    And the supplier dropdown "paper billing" displays value "<paper billing option>"

    Examples: 
      | paper billing | radio         | metadata      | paper billing option |
      | Paper billing | Paper billing | Paper billing | Paper Correspondence |
      | Paper billing | Paper billing | Paper billing | Text/SMS             |
      | Paper billing | Paper billing | Paper billing | Email                |
