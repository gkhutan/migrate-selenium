Feature: Add an account - Third Party Agent

  Scenario: Switch now user can successfully add another account to their account - econ7 & prepayment, delayed
    Given user logs in as a "registered" user "gurdeep+greenrose@migrate.co.uk","TestUser1","Login"
    And user selects the "Add an address" button
    And user validates the page heading "Adding another address to your account?"
    And user enters their postcode "OX4 3UJ"
    And user selects the "Recently moved in" type of user button
    And user selects the "Let's go" button
    And user has selected an energy type "Electric"
    And user selects the "econ meter yes" radio button
    And user selects the "prepayment meter yes" radio button
    And user selects the "Continue" button
    And user selects the "That's ok - let's continue" button
    And user selects their estimated usage information
      | In my house lives | My heating source is | My energy usage is     | My insulation is |
      | 1 Person          | Gas                  | Low user (second home) | Paper-thin       |
    And user selects the "Usage" button
    And user selects the "Continue" button
    And user is on the register page
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                         |
      | title              | Mrs                                           |
      | firstname          | GurdeepTest                                   |
      | lastname           | Test                                          |
      | Phone number       |                                   01903242773 |
      | select address     | 23, Newman Road, OXFORD, Oxfordshire, OX4 3UJ |
      | employment status  | Self Employed                                 |
      | residential status | Landlord                                      |
    And user selects the "third party t&cs" radio button
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    Then user validates the page heading two "GurdeepTest, you're all set!"
    And user selects the "Look at your migration" button
    And user sees the "switched" user dashboard
    And user validates the address "23, Newman Road, OXFORD, Oxfordshire, OX4 3UJ"
    And user selects the "Prepayment contact us" link
    And user selects the "Accounts" link
    And user selects the "Add an address" button
    And user enters their postcode "AA00AA"
    And user selects the region "Midlands"
    And user selects the "I have a bill to hand" type of user button
    And user selects the "Let's go" button
    And user has selected an energy type "Gas & Electric"
    When user selects a supplier and tariff and payment method
      | dual supplier | SSE                    |
      | dual tariff   | 1 Year Fixed v16       |
      | dual payment  | Pay On Receipt Of Bill |
    And user selects the "Continue" button
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And user sees the "delayed" prompt
    And user has selected to switch "later"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields           | value                     |
      | title                 | Mr                        |
      | firstname             | Gurdeep kaur              |
      | lastname              | Test                      |
      | Phone number          |               01903242993 |
      | house no              |                       444 |
      | first line of address | Durrington, Goring By Sea |
      | employment status     | Self Employed             |
      | residential status    | Landlord                  |
      | electric meter number |             1013092420412 |
      | gas meter number      |                8822948210 |
      | account name          | Test Account Name         |
      | account number        |                  55779911 |
      | sort code             |                    200000 |
    And user selects the "third party t&cs" radio button
    Then user selects the "t&cs" radio button
    And user selects the "Sign up" button
    Then user validates the page heading two "Congratulations Gurdeep kaur!"
    And user selects the "Look at your migration" button
    And user sees the "delayed" user dashboard
    And user validates the address "444, Durrington Road, Goring By Sea, AA00AA"
    Then user selects the "Accounts" button
    And user searches for search term "OX4 3UJ"
    Then address "23, Newman Road, OXFORD, Oxfordshire, OX4 3UJ" is "displayed"
    And selects an address "4, Newman Road, OXFORD, Oxfordshire, OX4 3UJ"
    And user sees the "switched" user dashboard
    And user selects the "Log out" button
    And user validates the home page heading
 