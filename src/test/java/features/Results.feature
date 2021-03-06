Feature: Results
  
  As an unregistered user I want to be able to select a deal and switch to that deal

  Background: 

  @ready
  Scenario Outline: Selecting the supplier options updates the metadata on the page accordingly
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "<supplier>" button
    And user selects the "<radio>" radio button
    And user validates the metadata field "<metadata>"
    Then there is at least one result displayed

    Examples: 
      | supplier     | radio         | metadata      |
      | All deals    | None          | None          |
      | Green energy | None          | Green Energy  |
      | None         | Ratings       | Top rated     |
      | None         | WHD           | WHD           |
      | None         | Paper Billing | Paper billing |
      | Green energy | Paper Billing | Paper billing |
      | Green energy | WHD           | WHD           |
      | Green energy | Ratings       | Top rated     |

  @todo
  Scenario: User selects a tariff
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user has selected an energy type "Gas & Electric"
    And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    Then there is at least one result displayed
    And user selects the tariff ""
#	@todo
  #Scenario Outline: Results should display the correct route info text for No Bill to Hand routes (Start on I Have A Bill but Exit on I Dont Have a Bill)
    #Given I am a new user type with known postcode "Welcome!","BN12 6HU","I have a bill to hand","Let's go"
    #And user has selected an energy type "Gas & Electric"
    #And user has selected their default energy supplier information
    #When user selects the "Help me estimate" button
      #When user selects their estimated usage information
      #| In my house lives | My energy usage is                  | My insulation is          |
      #| 5+ People         | Below average (professional couple) | Well-wrapped average home |
    #Then user selects the "Usage" button
#
#
    #Examples: 
      #| Route                                                 | User                  | In my house lives     | Message    |                                                                                  |  |
      #| Start on I Have A Bill but Exit on I Dont Have a Bill | I have a bill to hand | I don't have a bill   | message    |  
      #| Start and Exit on I Have a Bill                       | I have a bill to hand | None                  | message    |  
