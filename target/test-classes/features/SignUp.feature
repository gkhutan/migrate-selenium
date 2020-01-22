Feature: Sign up
  
  As a new user I want to be able to sign up successfully to obtain a quote

  Background: 
    Given user navigates to "signup"
    Then user validates the page heading "Welcome!"
    And user selects the "Cookie Ok" button
	
  Scenario Outline: Entering unknown postcode should display the region field
    And user enters their postcode "<postcode>"
    Then the "region" field is "displayed"
    And user selects the region "<region>"
    And user selects the "Let's go" button

    Examples: 
      | postcode | region    | button   |
      | RE43ED   | London    | disabled |
   

  Scenario Outline: Entering an invalid postcode format should display validation message
    And user enters their postcode "<postcode>"
    And user presses the space bar
    And user sees validation message "Please provide a valid UK postcode"

    Examples: 
      | postcode | button   |
      | WA37U    | disabled |
      | ka34 6H  | disabled |
 
  Scenario Outline: Signing up successfully as a type of user
    And user enters their postcode "<postcode>"
    And user selects the "<typeOfUser>" type of user button
    And user selects the "Let's go" button
    Then user validates the page heading "What type of energy does your home use?"
    And user selects the "Continue" button
    And user sees the "<supplierPage>" supplier page
    Then user validates the "signup/supplier-info" URL

    Examples: 
      | postcode | typeOfUser            | supplierPage          |  
      | AB101AA  | I have a bill to hand | I have a bill to hand |  
      | AB101AA  | No bill to hand       | No bill to hand       |  
      | AB101AA  | Recently Moved In     | Recently Moved In     |  


  Scenario Outline: Validation message should appear if region field is left empty
    Given user navigates to "signup"
    And user enters their postcode "<postcode>"
    Then the "region" field is "not displayed"
    And user sees validation message "Please provide your region."

    Examples: 
      | postcode |
      | ee00ee   |
