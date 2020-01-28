Feature: Blog - Marketing pages

  Scenario: Selecting the link to the Blog displays the Blog
    Given user navigates to ""
    And user selects the "Blog" link
    Then user validates the "blog" URL
    And user selects the "Read more" button
    #And user selects the blog links
    #And user verifies the links are working
