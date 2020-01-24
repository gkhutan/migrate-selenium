Feature: Prepayment Meter - I have a bill to hand
  
  - As an unregistered user I want to be able to sign up successfully with my Prepayment meter
  
	@ready @smoketest
  Scenario Outline: User can successfully sign up with a Prepayment meter - separate gas and electric suppliers
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"
    And user selects "<Energy Type>" energy type
    And user selects the "Continue" button
    And user selects the "<Supplier button>" button
    And user selects a supplier and tariff and payment method
      | supplier | Brilliant Energy       |
      | tariff   | Standard Fair Deal     |
      | payment  | Quarterly Direct Debit |
    And user selects the "Gas" button
    And user scrolls down
    And user selects a supplier and tariff and payment method
      | supplier | Co-op Energy                        |
      | tariff   | Co-op Safe and Secure Paper Billing |
      | payment  | Pay On Receipt Of Bill              |
    And user selects the "Continue" button
    And user enters their "electric kWh" usage numbers "330"
    And user selects the "electric" frequency to "Quarterly"
    And user enters their "gas kWh" usage numbers "220"
    And user selects the "gas" frequency to "Monthly"
    And user selects the "I Spend Elec" radio button
    And user enters their "electric spend" usage numbers "440"
    And user selects the "electric spend" frequency to "Annually"
    And user selects the "I Spend Gas" radio button
    And user enters their "gas spend" usage numbers "550"
    And user selects the "gas spend" frequency to "Quarterly"
    And user selects top nav icon "Supplier"
    And user selects the "econ meter yes" button
    And user selects the "Continue" button
    And user selects the "I use Elec" radio button
    And user enters their "electric day kWh" usage numbers "660"
    And user enters their "electric night kWh" usage numbers "770"
    And user selects the "I Spend Elec" radio button
    And user enters their "electric spend" usage numbers "880"
    And user selects the "Continue" button
    And user selects the "Continue" button
    And user selects the "Continue" button
    And user enters a new user email "gurdeep@migrate.co.uk"
    And user enters their password "TestUser1"
    And user enters their confirm password "TestUser1"
    And user selects the "Let's Go" button
    And they enter a dob "1903 1980"
    And user selects the lived for three years field to "no"
    And user selects the supply address same as billing address field to "no"
    And user enters their details to register
      | form fields                      | value                                                           |
      | title                            | Mr                                                              |
      | firstname                        | Gurdeep                                                         |
      | lastname                         | Test                                                            |
      | Phone number                     |                                                     01903242773 |
      | select address                   | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | house no                         | 20a                                                             |
      | first line of address            | Preston Road, Littlemore                                        |
      | employment status                | Self Employed                                                   |
      | residential status               | Landlord                                                        |
      | account name                     | Test Account Name                                               |
      | account number                   |                                                        55779911 |
      | sort code                        |                                                          200000 |
      | time at current address          |                                                               2 |
      | previous address postcode        | ee00ee                                                          |
      | previous house no                |                                                              10 |
      | second address line1             | Newman Road                                                     |
      | time at previous address         |                                                               2 |
      | second previous address postcode | aa00aa                                                          |
      | third house no                   | 19a                                                             |
      | third address line1              | Oxford Road                                                     |
      | billing address postcode         | bb00bb                                                          |
      | billing house no                 |                                                             123 |
      | billing address line1            | Brighton Road                                                   |
      | electric meter number            |                                                   1013092420412 |
      | gas meter number                 |                                                      8822948210 |
    And user selects the "t&cs" radio button
    And user selects the "Sign up" button
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL

    Examples: 
      | Energy Type    | Supplier button  |
      | Gas & Electric | same supplier no |
