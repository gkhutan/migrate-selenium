$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("src/test/java/features/IHaveABill/IHaveABill-EconMeter.feature");
formatter.feature({
  "name": "Economy 7 meter - I have a bill",
  "description": "",
  "keyword": "Feature"
});
formatter.scenarioOutline({
  "name": "Economy 7 meter and Prepayment meter user can successfully Sign up and view and edit their details on the Dashboard - Prepayment, Econ 7 \u0026 Electric",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@ready"
    },
    {
      "name": "@test"
    }
  ]
});
formatter.step({
  "name": "I am a new user type with known postcode \"Welcome!\",\"bn126hu\",\"I have a bill to hand\",\"Let\u0027s go\"",
  "keyword": "Given "
});
formatter.step({
  "name": "user selects \"\u003cEnergy Type\u003e\" energy type",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Continue\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects a supplier and tariff and payment method",
  "keyword": "And ",
  "rows": [
    {
      "cells": [
        "elec supplier",
        "npower"
      ]
    },
    {
      "cells": [
        "elec tariff",
        "Standard"
      ]
    },
    {
      "cells": [
        "elec payment",
        "Prepayment Meter"
      ]
    }
  ]
});
formatter.step({
  "name": "user selects the \"\u003cEcon meter\u003e\" radio button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Continue\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"\u003cPrepayment button\u003e\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user has entered their usage numbers \"\u003cElecDayUsage\u003e\",\"\u003cDayUsage\u003e\",\"\u003cElecNightUsage\u003e\",\"\u003cNightUsage\u003e\"",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Continue\" button",
  "keyword": "And "
});
formatter.step({
  "name": "when user creates an account",
  "keyword": "And "
});
formatter.step({
  "name": "user is on the register page",
  "keyword": "And "
});
formatter.step({
  "name": "they enter a dob \"1903 1980\"",
  "keyword": "And "
});
formatter.step({
  "name": "user enters their details to register",
  "keyword": "And ",
  "rows": [
    {
      "cells": [
        "form fields",
        "value"
      ]
    },
    {
      "cells": [
        "title",
        "Mr"
      ]
    },
    {
      "cells": [
        "firstname",
        "Gurdeep"
      ]
    },
    {
      "cells": [
        "lastname",
        "Test"
      ]
    },
    {
      "cells": [
        "Phone number",
        "01903242773"
      ]
    },
    {
      "cells": [
        "Select Address",
        "4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU"
      ]
    },
    {
      "cells": [
        "Employment Status",
        "Self Employed"
      ]
    },
    {
      "cells": [
        "Residential Status",
        "Landlord"
      ]
    }
  ]
});
formatter.step({
  "name": "user selects the \"t\u0026cs\" radio button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Sign up\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user has selected confirm in the congrats popup",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Edit Usage\" button",
  "keyword": "Given "
});
formatter.step({
  "name": "user enters their \"\u003cElecDayUsage\u003e\" usage numbers \"2222\"",
  "keyword": "And "
});
formatter.step({
  "name": "user enters their \"\u003cElecNightUsage\u003e\" usage numbers \"5555\"",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Save usage\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Edit preferences\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user edits their preferences on the dashboard",
  "keyword": "And ",
  "rows": [
    {
      "cells": [
        "switch preference",
        "ratings",
        "whd"
      ]
    },
    {
      "cells": [
        "Cheapest of the green tariffs",
        "4+ Stars",
        "I am eligible"
      ]
    }
  ]
});
formatter.step({
  "name": "user selects the \"Save Preferences\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Edit details\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user edits their personal details on the dashboard",
  "keyword": "And ",
  "rows": [
    {
      "cells": [
        "Title",
        "Mr"
      ]
    },
    {
      "cells": [
        "Firstname",
        "Gurdeep2"
      ]
    },
    {
      "cells": [
        "Lastname",
        "Kaur"
      ]
    },
    {
      "cells": [
        "Employment status",
        "Student"
      ]
    },
    {
      "cells": [
        "Residential status",
        "Tenant"
      ]
    }
  ]
});
formatter.step({
  "name": "user selects the \"save details\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user selects the \"Log out\" button",
  "keyword": "And "
});
formatter.step({
  "name": "user validates the home page heading",
  "keyword": "And "
});
formatter.examples({
  "name": "",
  "description": "",
  "keyword": "Examples",
  "rows": [
    {
      "cells": [
        "Energy Type",
        "Econ meter",
        "Prepayment button",
        "ElecDayUsage",
        "DayUsage",
        "ElecNightUsage",
        "NightUsage"
      ]
    },
    {
      "cells": [
        "Electric",
        "econ meter yes",
        "That\u0027s ok - let\u0027s continue",
        "Electric day kwh",
        "2000",
        "Electric night kwh",
        "4000"
      ]
    }
  ]
});
formatter.scenario({
  "name": "Economy 7 meter and Prepayment meter user can successfully Sign up and view and edit their details on the Dashboard - Prepayment, Econ 7 \u0026 Electric",
  "description": "",
  "keyword": "Scenario Outline",
  "tags": [
    {
      "name": "@ready"
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
  "name": "I am a new user type with known postcode \"Welcome!\",\"bn126hu\",\"I have a bill to hand\",\"Let\u0027s go\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.I_am_a_new_user_type_with_known_postcode(String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects \"Electric\" energy type",
  "keyword": "And "
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
  "name": "user selects a supplier and tariff and payment method",
  "rows": [
    {
      "cells": [
        "elec supplier",
        "npower"
      ]
    },
    {
      "cells": [
        "elec tariff",
        "Standard"
      ]
    },
    {
      "cells": [
        "elec payment",
        "Prepayment Meter"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_a_supplier_and_tariff_and_payment_method(String,String\u003e)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"econ meter yes\" radio button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_radio_button(String)"
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
  "name": "user selects the \"That\u0027s ok - let\u0027s continue\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user has entered their usage numbers \"Electric day kwh\",\"2000\",\"Electric night kwh\",\"4000\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_has_entered_their_usage_numbers(String,String,String,String)"
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
  "name": "when user creates an account",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.when_user_creates_an_account()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user is on the register page",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_is_on_the_register_page()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "they enter a dob \"1903 1980\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.they_enter_a_dob(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user enters their details to register",
  "rows": [
    {
      "cells": [
        "form fields",
        "value"
      ]
    },
    {
      "cells": [
        "title",
        "Mr"
      ]
    },
    {
      "cells": [
        "firstname",
        "Gurdeep"
      ]
    },
    {
      "cells": [
        "lastname",
        "Test"
      ]
    },
    {
      "cells": [
        "Phone number",
        "01903242773"
      ]
    },
    {
      "cells": [
        "Select Address",
        "4, Melville Way, Goring-by-sea, WORTHING, West Sussex, BN12 6HU"
      ]
    },
    {
      "cells": [
        "Employment Status",
        "Self Employed"
      ]
    },
    {
      "cells": [
        "Residential Status",
        "Landlord"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_enters_their_details_to_register(String,String\u003e)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"t\u0026cs\" radio button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_radio_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Sign up\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user has selected confirm in the congrats popup",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_has_selected_confirm_in_the_congrats_popup()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Edit Usage\" button",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user enters their \"Electric day kwh\" usage numbers \"2222\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_enters_their_usage_numbers(String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user enters their \"Electric night kwh\" usage numbers \"5555\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_enters_their_usage_numbers(String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Save usage\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Edit preferences\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user edits their preferences on the dashboard",
  "rows": [
    {
      "cells": [
        "switch preference",
        "ratings",
        "whd"
      ]
    },
    {
      "cells": [
        "Cheapest of the green tariffs",
        "4+ Stars",
        "I am eligible"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_edits_their_preferences_on_the_dashboard(DataTable)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Save Preferences\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Edit details\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user edits their personal details on the dashboard",
  "rows": [
    {
      "cells": [
        "Title",
        "Mr"
      ]
    },
    {
      "cells": [
        "Firstname",
        "Gurdeep2"
      ]
    },
    {
      "cells": [
        "Lastname",
        "Kaur"
      ]
    },
    {
      "cells": [
        "Employment status",
        "Student"
      ]
    },
    {
      "cells": [
        "Residential status",
        "Tenant"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_edits_their_personal_details_on_the_dashboard(String,String\u003e)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"save details\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Log out\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the home page heading",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_validates_the_home_page_heading()"
});
formatter.result({
  "status": "passed"
});
formatter.write("Finished Scenario");
formatter.after({
  "status": "passed"
});
formatter.uri("src/test/java/features/RecentlyMovedIn/MovedIn-Register.feature");
formatter.feature({
  "name": "Register - Recently Moved In",
  "description": "",
  "keyword": "Feature"
});
formatter.scenario({
  "name": "A returning user starts again in the same session with an unknown postcode and successfully sign up and view dashboard",
  "description": "",
  "keyword": "Scenario",
  "tags": [
    {
      "name": "@ready"
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
  "name": "I am a new user type with known postcode \"Welcome!\",\"bn126hu\",\"Recently Moved In\",\"Let\u0027s go\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.I_am_a_new_user_type_with_known_postcode(String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user has selected an energy type \"Gas \u0026 Electric\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_has_selected_an_energy_type(String)"
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
  "name": "user selects their estimated usage information",
  "rows": [
    {
      "cells": [
        "In my house lives",
        "My energy usage is",
        "My insulation is"
      ]
    },
    {
      "cells": [
        "2 People",
        "Below average (professional couple)",
        "Well-wrapped average home"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_their_estimated_usage_information(DataTable)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Usage\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
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
  "name": "when user creates an account",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.when_user_creates_an_account()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user is on the register page",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_is_on_the_register_page()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user scrolls down",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_scrolls_down()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Start again\" button",
  "keyword": "When "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects \"confirm\" in the start again prompt",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_in_the_start_again_prompt(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user is navigated to the returning users sign up page",
  "keyword": "Then "
});
formatter.match({
  "location": "LoginStep.user_is_navigated_to_the_returning_users_sign_up_page()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "a returning user wants to start again with a unknown postcode \"Welcome back!\",\"ee00ee\",\"Recently moved in\",\"London\",\"Let\u0027s go\",\"What type of energy does your home use?\"",
  "keyword": "Given "
});
formatter.match({
  "location": "LoginStep.a_returning_user_wants_to_start_again_with_a_unknown_postcode(String,String,String,String,String,String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user has selected an energy type \"Electric\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_has_selected_an_energy_type(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"econ meter no\" radio button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_radio_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"prepayment meter no\" radio button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_radio_button(String)"
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
  "name": "user selects their estimated usage information",
  "rows": [
    {
      "cells": [
        "In my house lives",
        "My energy usage is",
        "My insulation is"
      ]
    },
    {
      "cells": [
        "5 People",
        "Normal user (family house)",
        "Paper-thin"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_their_estimated_usage_information(DataTable)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Usage\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Green energy\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
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
  "name": "user is on the register page",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_is_on_the_register_page()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "they enter a dob \"1903 1980\"",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.they_enter_a_dob(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user enters their details to register",
  "rows": [
    {
      "cells": [
        "form fields",
        "value"
      ]
    },
    {
      "cells": [
        "title",
        "Mrs"
      ]
    },
    {
      "cells": [
        "firstname",
        "Gurdeep"
      ]
    },
    {
      "cells": [
        "lastname",
        "Test"
      ]
    },
    {
      "cells": [
        "Phone number",
        "01903242773"
      ]
    },
    {
      "cells": [
        "house no",
        "20a"
      ]
    },
    {
      "cells": [
        "first line of address",
        "Preston Road, Littlemore"
      ]
    },
    {
      "cells": [
        "employment status",
        "Self Employed"
      ]
    },
    {
      "cells": [
        "residential status",
        "Landlord"
      ]
    },
    {
      "cells": [
        "electric meter number",
        "1013092420412"
      ]
    },
    {
      "cells": [
        "account name",
        "Test Account Name"
      ]
    },
    {
      "cells": [
        "account number",
        "55779911"
      ]
    },
    {
      "cells": [
        "sort code",
        "200000"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_enters_their_details_to_register(String,String\u003e)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"T\u0026CS\" radio button",
  "keyword": "Then "
});
formatter.match({
  "location": "LoginStep.user_selects_the_radio_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Sign up\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user has selected confirm in the congrats popup",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_has_selected_confirm_in_the_congrats_popup()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user selects the \"Log out\" button",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_selects_the_button(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "user validates the home page heading",
  "keyword": "And "
});
formatter.match({
  "location": "LoginStep.user_validates_the_home_page_heading()"
});
formatter.result({
  "status": "passed"
});
formatter.write("Finished Scenario");
formatter.after({
  "status": "passed"
});
});