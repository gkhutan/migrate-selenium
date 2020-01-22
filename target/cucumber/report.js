$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("src/test/java/features/EnergyType.feature");
formatter.feature({
  "name": "Energy Type",
  "description": "  As an unregistered user I want to be able to provide my energy type for my home so that I can obtain a quote for my energy",
  "keyword": "Feature"
});
formatter.scenarioOutline({
  "name": "Selecting an energy type navigates user to the supplier info page",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "user selects \"\u003cenergy type\u003e\" energy type",
  "keyword": "When "
});
formatter.step({
  "name": "user selects the \"Continue\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user validates the page heading \"\u003cheading\u003e\"",
  "keyword": "Then "
});
formatter.examples({
  "name": "",
  "description": "",
  "keyword": "Examples",
  "rows": [
    {
      "cells": [
        "energy type",
        "buttonState",
        "heading"
      ]
    },
    {
      "cells": [
        "Gas \u0026 Electric",
        "active",
        "Who\u0027s your current supplier?"
      ]
    },
    {
      "cells": [
        "Electric",
        "active",
        "Who your current supplier?"
      ]
    }
  ]
});
formatter.background({
  "name": "",
  "description": "",
  "keyword": "Background"
});
formatter.before({
  "status": "passed"
});
formatter.step({
  "name": "I am a new user type with known postcode \"Welcome!\",\"BN126HU\",\"No bill to hand\",\"Let\u0027s go\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.I_am_a_new_user_type_with_known_postcode(String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects top nav icon \"Energy\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.user_selects_top_nav_icon(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the page heading \"What type of energy does your home use?\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_validates_the_page_heading(String)"
});
formatter.result({
  "status": "passed"
});
formatter.scenario({
  "name": "Selecting an energy type navigates user to the supplier info page",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "user selects \"Gas \u0026 Electric\" energy type",
  "keyword": "When "
});
formatter.match({
  "location": "LoginStep.user_selects_energy_type(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Continue\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the page heading \"Who\u0027s your current supplier?\"",
  "keyword": "Then "
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
formatter.background({
  "name": "",
  "description": "",
  "keyword": "Background"
});
formatter.before({
  "status": "passed"
});
formatter.step({
  "name": "I am a new user type with known postcode \"Welcome!\",\"BN126HU\",\"No bill to hand\",\"Let\u0027s go\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.I_am_a_new_user_type_with_known_postcode(String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects top nav icon \"Energy\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.user_selects_top_nav_icon(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the page heading \"What type of energy does your home use?\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_validates_the_page_heading(String)"
});
formatter.result({
  "status": "passed"
});
formatter.scenario({
  "name": "Selecting an energy type navigates user to the supplier info page",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "user selects \"Electric\" energy type",
  "keyword": "When "
});
formatter.match({
  "location": "LoginStep.user_selects_energy_type(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Continue\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the page heading \"Who your current supplier?\"",
  "keyword": "Then "
});
formatter.match({
  "location": "LoginStep.user_validates_the_page_heading(String)"
});
formatter.result({
  "error_message": "java.lang.AssertionError: The page heading does not match - expected page heading Who your current supplier? actual page heading was Who\u0027s your current supplier?\r\n\tat org.junit.Assert.fail(Assert.java:89)\r\n\tat seleniumgluecode.LoginStep.user_validates_the_page_heading(LoginStep.java:1238)\r\n\tat ✽.user validates the page heading \"Who your current supplier?\"(src/test/java/features/EnergyType.feature:14)\r\n",
  "status": "failed"
});
formatter.write("Finished Scenario");
formatter.after({
  "status": "passed"
});
formatter.uri("src/test/java/features/SignUp.feature");
formatter.feature({
  "name": "Sign up",
  "description": "  As a new user I want to be able to sign up successfully to obtain a quote",
  "keyword": "Feature"
});
formatter.scenarioOutline({
  "name": "Entering unknown postcode should display the region field",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "user enters their postcode \"\u003cpostcode\u003e\"",
  "keyword": "And "
});
formatter.step({
  "name": "the \"region\" field is \"displayed\"",
  "keyword": "Then "
});
formatter.step({
  "name": "user selects the region \"\u003cregion\u003e\"",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Let\u0027s go\" button",
  "keyword": "And "
});
formatter.examples({
  "name": "",
  "description": "",
  "keyword": "Examples",
  "rows": [
    {
      "cells": [
        "postcode",
        "region",
        "button"
      ]
    },
    {
      "cells": [
        "RE43ED",
        "London",
        "disabled"
      ]
    }
  ]
});
formatter.background({
  "name": "",
  "description": "",
  "keyword": "Background"
});
formatter.before({
  "status": "passed"
});
formatter.step({
  "name": "user navigates to \"signup\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.user_navigates_to(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the page heading \"Welcome!\"",
  "keyword": "Then "
});
formatter.match({
  "location": "LoginStep.user_validates_the_page_heading(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Cookie Ok\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.scenario({
  "name": "Entering unknown postcode should display the region field",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "user enters their postcode \"RE43ED\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_enters_their_postcode(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "the \"region\" field is \"displayed\"",
  "keyword": "Then "
});
formatter.match({
  "location": "LoginStep.the_field_appear(String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the region \"London\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_region(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Let\u0027s go\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.write("Finished Scenario");
formatter.after({
  "status": "passed"
});
});