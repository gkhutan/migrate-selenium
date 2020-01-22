package utils;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import cucumber.api.java.en.Given;

public abstract class AbstractContext {
	
	public static WebDriver driver;

	public static final String PAGE_URL_HOME_UAT="https://rewriteuat.migrate.co.uk/";
	public static final String PAGE_URL_HOME_DEV="https://rewritedev.migrate.co.uk/";
	public static final String PAGE_URL_COUNCIL_HOME_DEV="https://rewritedev.migrate.co.uk/coffeecaravan";
	public static final String PAGE_URL_COUNCIL_HOME_UAT="https://rewriteuat.migrate.co.uk/coffeecaravan";
	public static final String PAGE_URL_SIGNUP="https://rewriteuat.migrate.co.uk/signup";
	public static final String PAGE_URL_LOGIN="https://rewriteuat.migrate.co.uk/login";
	public static final String PAGE_URL_ACCOUNTS="https://rewritedev.migrate.co.uk/accounts";
	public static final String PAGE_URL_ENERGY_TYPE="https://rewritedev.migrate.co.uk/signup/energy-type";
	public static final String PAGE_URL_SUPPLIER_INFO="https://rewritedev.migrate.co.uk/signup/supplier-info";
	public static final String PAGE_URL_DASHBOARD="https://rewriteuat.migrate.co.uk/dashboard";
	public static final String PAGE_URL_USAGE="https://rewriteuat.migrate.co.uk/signup/usage";
	public static final String PAGE_URL_CREATE_AN_ACCOUNT="https://rewritedev.migrate.co.uk/signup/create-account";
	
	public static final String PAGE_NAME_HOME_PAGE="";
	public static final String PAGE_URL_AWIN="?awc=lookatthisitsanewreference_dontforgetthis";
		
	public static final String PAGE_NAME_ENERGY_TYPE="signup/energy-type";
	public static final String PAGE_NAME_SUPPLIER_INFO="signup/supplier-info";
	public static final String PAGE_NAME_I_KNOW_MY_NUMBERS="signup/usage/know-my-numbers";
	public static final String PAGE_NAME_ESTIMATOR="signup/usage/estimator";
	public static final String PAGE_NAME_RESULTS="signup/results";
	public static final String PAGE_NAME_REGISTER="signup/register";
	public static final String PAGE_NAME_DASHBOARD="dashboard";
	public static final String PAGE_NAME_SIGN_UP="signup";
	public static final String PAGE_NAME_LOGIN="login";
	public static final String PAGE_NAME_CREATE_AN_ACCOUNT="signup/create-account";
	
	public static final String PAGE_NAME_MEET_MIGRATE="meet-migrate";
	public static final String PAGE_NAME_PRIVACY_POLICY="privacy-policy";
	public static final String PAGE_NAME_WHAT_IS_MIGRATE="about";
	public static final String PAGE_NAME_FAQS="faqs";
	public static final String PAGE_NAME_TCS="terms-and-conditions";
	public static final String PAGE_NAME_BLOG="blog";
	public static final String PAGE_NAME_CONTACT_US="contact-us";
	
    protected final String RESULTS_PAGE_SCROLL_Y="2000";
    
    protected final String HOME_PAGE_HEADING="Save on your bills, Switch energy,\n" + 
    		"Do good.";
    protected final String HOME_PAGE_COUNCIL_HEADING="Get the cheapest energy every single year for free";
    protected final String BRITISH_GAS_TARIFF="";
    protected final String OVO_TARIFF="";
    
    protected final String DASHBOARD_ELEC_ECON_PRE_VAR_USER = "gurdeep+0012@migrate.co.uk";
    protected final String DASHBOARD_DUAL_ECON_PRE_USER = "gurdeep+@migrate.co.uk";
    protected final String DASHBOARD_DUAL_USER = "gurdeep+jan3@migrate.co.uk";
    protected final String DASHBOARD_ELEC_PRE_USER = "gurdeep08134813@migrate.co.uk";
    protected final String RETURNING_USER = "gurdeep03202917@migrate.co.uk";
    protected final String TEST_UNKNOWN_ADDRESS_USER = "gurdeep+dec55@migrate.co.uk";
    protected final String DASHBOARD_DUAL_ECON_USER = "gurdeep+dec54@migrate.co.uk";
    protected final String DELAYED_USER = "gurdeep+dec55@migrate.co.uk";
    
    protected void windowScroll(String yCord){

		JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("javascript:window.scrollBy(0,"+yCord+")");
   
	}
	
	protected void windowScrollUp(){
		
		JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("javascript:window.scrollTo(0,0)");
		
	}
	
	
}