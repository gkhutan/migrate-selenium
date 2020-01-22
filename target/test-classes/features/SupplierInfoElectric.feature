Feature: Supplier Info Electric

  Background: 
    Given I am a new user type with known postcode "Welcome!","bn126hu","I have a bill to hand","Let's go"

  #@ready
  #Scenario: Selecting Prepayment Payment method should display the Prepayment prompt
    #And user has selected an energy type "Electric"
    #And user selects a supplier and tariff and payment method
      #| elec supplier | npower           |
      #| elec tariff   | Standard         |
      #| elec payment  | Prepayment Meter |
    #And user selects the "Continue" button
    #Then user sees the "Prepayment meter" prompt
    #And user selects the "That's ok - let's continue" button
    #Then user validates the page heading "What's your current usage?"

	@ready
  Scenario: Selecting Prepayment Payment method should display the Prepayment prompt
    And user has selected an energy type "dual"
    And user selects a supplier and tariff and payment method
      | dual supplier | EDF Energy          |
      | dual tariff   | Standard (Variable) |
      | dual payment  | Prepayment Meter    |
    And user selects the "Continue" button
    Then user sees the "Prepayment meter" prompt
    And user selects the "That's ok - let's continue" button
    Then user validates the page heading "What's your current usage?"

#	@ready
  #Scenario: User can successfully sign up with a Prepayment meter - separate gas and electric suppliers
    #And user selects "dual" energy type
    #And user selects the "Continue" button
    #And user selects the "same supplier no" radio button
    #And user selects a supplier and tariff and payment method
      #| supplier | Brilliant Energy       |
      #| tariff   | Standard Fair Deal     |
      #| payment  | Quarterly Direct Debit |
    #And user selects the "Gas" button
    #And user scrolls down
    #And user selects a supplier and tariff and payment method
      #| supplier | Co-op Energy                        |
      #| tariff   | Co-op Safe and Secure Paper Billing |
      #| payment  | Pay On Receipt Of Bill              |
    #And user selects the "Continue" button
#
#	@ready
  #Scenario: Selecting Prepayment Payment method should display the Prepayment prompt
    #And user has selected an energy type "Electric"
    #And user selects the "Continue" button
    #And user has entered their electric usage number "5000"
    #And user selects the more info link for a tariff
