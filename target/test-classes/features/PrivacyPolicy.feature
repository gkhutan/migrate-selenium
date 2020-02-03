Feature: Privacy Policy


	@ready
	Scenario: Selecting OK on the privacy policy banner closes the banner
	Given user navigates to "Home"
	And user selects the "cookie privacy policy" link		
	And user validates the page heading "Privacy Policy"
	And user selects the "privacy cookie OK" button

	
	