Feature: Dashboard - Third Party Agent

  @ready
  Scenario: User confirms address has been added to the dashboard
	@ready
  Scenario: Agent can add another address successfully
    Given user navigates to a council page "coffeecaravan", "Coffee Caravan Energy"
    Given user logs in as a "registered" user "gurdeep+assist5@migrate.co.uk","TestUser1","Login"
    And user selects the "Add an address" button
    And user validates the page heading "Adding another address to your account?"
    And user enters their postcode "GU307TH"
    And user selects the "I have a bill to hand" type of user button
    And user selects the "Let's go" button
    And user has selected an energy type "Gas & Electric"
    When user selects a supplier and tariff and payment method
      | dual supplier | npower                 |
      | dual tariff   | Standard               |
      | dual payment  | Quarterly Direct Debit |
    And user selects the "Continue" button
    When user enters their "Electric kwh" usage numbers "5000"
    And user enters their "gas kwh" usage numbers "2000"
    When user selects the "Usage" button
    And user selects the "Continue" button
    And user is on the register page
    Then user selects the "enter your address manually" button
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields           | value              |
      | title                 | Mr                 |
      | firstname             | Gurdeep            |
      | lastname              | Test               |
      | Phone number          |        01903242773 |
      | house no              |                555 |
      | first line of address | Oxford Road, Wales |
      | employment status     | Self Employed      |
      | residential status    | Landlord           |
      | electric meter number |      1013092420412 |
      | gas meter number      |         8822948210 |
      | account name          | Test Account Name  |
      | account number        |           55779911 |
      | sort code             |             200000 |
    And user selects the "third party t&cs" radio button
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user sees the "switched" user dashboard
    And user validates the address "555, Oxford Road, Wales, GU307TH"
    And user selects the "Accounts" button
    And user selects the "Add an address" button
    And user enters their postcode "GU307TH"
    And user selects the "Recently Moved In" type of user button
    And user selects the "Let's go" button
    And user validates the page heading "Let's get things started..."
    And user has selected an energy type "Gas & Electric"
    And user selects the "economy meter no" button
    And user selects the "Continue" button
    And user selects their estimated usage information
      | In my house lives | My energy usage is                  | My insulation is          |
      | 5+ people         | Below average (professional couple) | Well-wrapped average home |
    And user selects the "Usage" button
    Then user validates the page text "Set your automatic switching preferences"
    And user selects the "Continue" button
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                            |
      | title              | Mr                                               |
      | firstname          | Gurdeep kaur                                     |
      | lastname           | Test                                             |
      | Phone number       |                                      01903242773 |
      | select address     | 5, Calgary Gardens, LIPHOOK, Hampshire, GU30 7TH |
      | employment status  | Self Employed                                    |
      | residential status | Landlord                                         |
      | account name       | Test Account Name                                |
      | account number     |                                         55779911 |
      | sort code          |                                           200000 |
    And user selects the "third party t&cs" radio button
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user has selected confirm in the congrats popup
    And user validates the address "5, Calgary Gardens, LIPHOOK, Hampshire, GU30 7TH"
    Then user selects the "Accounts" button
    And user searches for search term "GU307TH"
    Then address "1, Calgary Gardens, LIPHOOK, Hampshire, GU30 7TH" is "displayed"
    And selects an address "1, Calgary Gardens, LIPHOOK, Hampshire, GU30 7TH"
    And user sees the "switched" user dashboard
