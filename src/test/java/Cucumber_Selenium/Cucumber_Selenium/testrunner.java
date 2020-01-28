package Cucumber_Selenium.Cucumber_Selenium;

import org.junit.runner.RunWith;
import cucumber.api.junit.Cucumber;
import cucumber.api.CucumberOptions;
//import java.io.File;
//import org.junit.AfterClass;

@RunWith(Cucumber.class)
@CucumberOptions(
				features = "src/test/java/features",
				tags = 	 {"@smoketest"},
				plugin = {"pretty" ,"html:target/cucumber-report"},
				glue= 	 {"seleniumgluecode"},
				monochrome = true,
				strict = false
)

public class testrunner {
	
}
