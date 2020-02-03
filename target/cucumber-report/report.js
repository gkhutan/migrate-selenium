$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("src/test/java/features/Login.feature");
formatter.feature({
  "name": "Login",
  "description": "  As a new user I want to be able to login successfully",
  "keyword": "Feature"
});
formatter.scenario({
  "name": "Logging in successfully as a returning user",
  "description": "",
  "keyword": "Scenario",
  "tags": [
    {
      "name": "@ready"
    },
    {
      "name": "@smoketest"
    },
    {
      "name": "@test"
    }
  ]
});
formatter.before({
  "status": "passed"
});
formatter.step({
  "name": "user logs in as a \"Returning\" user \"returning\",\"TestUser1\",\"Login\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.user_logs_in_as_a_user(String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the page heading \"Choose your first switch\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_validates_the_page_heading(String)"
});
formatter.result({
  "status": "passed"
});
formatter.write("Finished Scenario");
formatter.after({
  "status": "passed"
});
});