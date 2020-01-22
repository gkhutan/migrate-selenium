Feature: Refer a friend

  @ready
  Scenario Outline: Referral code field contains the reference code
    Given user navigates to "<Email>"
    And user validates the page heading "Get switched to the cheapest energy deals every year. Automatically."
    And user validates the page heading two "<Message>"
    And user selects the "Cookie Ok" button
    And user enters their postcode "BN12 6HU"
    And user selects the "I have a bill to hand" type of user button
    And user selects the "Let's go" button
    And user has selected an energy type "Gas & Electric"
     And user has selected their default energy supplier information
    And user has entered their usage numbers "Electric kwh","2000","Gas kwh","5000"
    And user selects the "Continue" button
    And when user creates an account
    And user is on the register page
    And user selects the lived for three years field to "yes"
    And user selects the supply address same as billing address field to "yes"
    And user selects the "Electric" smart meter field to "yes"
    And they enter a dob "1903 1980"
    And user enters their details to register
      | form fields        | value                                                           |
      | title              | Mrs                                                             |
      | firstname          | Gurdeep                                                         |
      | lastname           | Test                                                            |
      | Phone number       |                                                     01903242773 |
      | select address     | 4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU |
      | employment status  | Self Employed                                                   |
      | residential status | Landlord                                                        |
      | account name       | Test Account Name                                               |
      | account number     |                                                        55779911 |
      | sort code          |                                                          200000 |
    Then user selects the "T&CS" radio button
    And user selects the "Sign up" button
    Then user validates the page heading two "Gurdeep, you're all set!"
    And user selects the "Look at your migration" button
    And user validates the "dashboard" URL
    And user selects the "Log out" button
    And user validates the home page heading

    Examples: 
      | Email                            | Message                                      |
      | signup?ref=jaime1a272731         | Use Jim’s sign-up page to get £20 each.      |
      | signup?ref=gurdeep%2B076fb994a48 | Use Gurdeep2’s sign-up page to get £20 each. |
