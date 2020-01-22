$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("file:src/test/java/features/test.feature");
formatter.feature({
  "name": "Login Feature",
  "description": "",
  "keyword": "Feature"
});
formatter.scenario({
  "name": "Login as a authenticated user",
  "description": "",
  "keyword": "Scenario",
  "tags": [
    {
      "name": "@test"
    }
  ]
});
formatter.before({
  "status": "passed"
});
formatter.step({
  "name": "user is  on homepage",
  "keyword": "Given "
});
formatter.match({
  "location": "Test.user_is_on_homepage()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user navigates to Login Page",
  "keyword": "When "
});
formatter.match({
  "location": "Test.user_navigates_to_Login_Page()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user enters username and Password",
  "keyword": "And "
});
formatter.match({
  "location": "Test.user_enters_username_and_Password()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "success message is displayed",
  "keyword": "Then "
});
formatter.match({
  "location": "Test.success_message_is_displayed()"
});
formatter.result({
  "status": "passed"
});
formatter.write("Finished Scenario");
formatter.after({
  "status": "passed"
});
});