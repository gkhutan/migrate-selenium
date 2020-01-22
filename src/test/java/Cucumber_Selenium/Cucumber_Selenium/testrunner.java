package Cucumber_Selenium.Cucumber_Selenium;

import org.junit.runner.RunWith;
import cucumber.api.junit.Cucumber;
import cucumber.api.CucumberOptions;
//import java.io.File;
//import org.junit.AfterClass;

@RunWith(Cucumber.class)
@CucumberOptions(
				features = "src/test/java/features",
				tags = 	 {"@test"},
				glue= 	 {"seleniumgluecode"},
				monochrome = true
)

public class testrunner {
	
}
