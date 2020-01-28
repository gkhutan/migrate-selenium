package seleniumgluecode;

import static org.junit.Assert.assertTrue;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import utils.AbstractContext;
import org.junit.Assert; 

public class LoginStep extends AbstractContext {
	

	public static WebDriver driver;
	
	private  WebElement webElement1;
	private  WebElement webElement2;
	
	private static String IHaveABillToHand="I have a bill to hand";
	private static String NoBillToHand="No bill to hand";
	private static String RecentlyMoved="Recently Moved In";
	
	
	@Before()
	public void setUp(){
		
		String pathToFFDriver = "C:\\Program Files\\selenium\\drivers\\geckodriver.exe";
		System.setProperty("webdriver.gecko.driver", pathToFFDriver);
	
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		
	}
	
	@After
    public static void tearDown(Scenario scenario) {
    	
		scenario.write("Finished Scenario");
		
    	System.out.println(scenario.isFailed());
    	 if (scenario.isFailed()) {
             byte[] screenshotBytes = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
             scenario.embed(screenshotBytes, "image/png");
         }
    	 
    	 if(driver != null) {
    		 driver.quit();
    	 }
	}
	
	
	protected WebElement getWebElementByXpath(String elementXpath){
		
		WebElement metaDataElement=null;
		
		try{
			metaDataElement= driver.findElement(By.xpath(elementXpath));
			
		}catch(NoSuchElementException e){			
		
			System.out.println("failed to get element "+elementXpath);
		}
		
		return metaDataElement;
	}
	
	public static void waitforElementThenClick(WebDriver driver, WebElement element) throws InterruptedException {
      
		try 
        {
            WebDriverWait wait = new WebDriverWait(driver, 100);
            wait.until(ExpectedConditions.elementToBeClickable(element));
            element.click();
        } 
        catch (Exception e) {
        }
    }
	
	@Given("user navigates to {string}")
	public void user_navigates_to(String string) {
	
		string = string.toLowerCase().trim();
		
		if(string.equalsIgnoreCase("home"))
		{
			driver.navigate().to(PAGE_URL_HOME_UAT);
		
		}else {
			driver.navigate().to(PAGE_URL_HOME_UAT+string);
		}
	}
	
	@Given("user navigates to a council page {string}, {string}")
	public void user_navigates_to_a_council_page(String councilPage, String pageTitle) throws InterruptedException {
	    
		user_navigates_to(councilPage);
		user_validates_the_page_title(pageTitle);
	}
	
	//add an account
	@Given("user has added a known address {string},{string},{string},{string},{string}")
	public void user_has_added_a_known_address(String button, String postcode, String typeOfUser, String pageHeading, String submitButton) throws InterruptedException {

		user_selects_the_button(button);
		user_validates_the_page_heading(pageHeading);
		user_enters_their_postcode(postcode);
		user_selects_the_type_of_user_button(typeOfUser);
		user_selects_the_button(submitButton);
	
	}
	
	//add an account
	@Given("user has added an unknown address {string},{string},{string},{string},{string},{string}")
	public void user_has_added_an_unknown_address(String button, String postcode, String typeOfUser, String regionName, String pageHeading, String submitButton) throws InterruptedException {

		user_selects_the_button(button);
		user_validates_the_page_heading(pageHeading);
		user_enters_their_postcode(postcode);
		user_selects_the_type_of_user_button(typeOfUser);
		user_selects_the_region(regionName);
		user_selects_the_button(submitButton);
	
	}

	@And("user is on the {string} page")
	public boolean user_is_on_the_page(String actualPage) throws InterruptedException {
	    
		Thread.sleep(2000);
		
		 driver.getCurrentUrl();
		 String pageURL = PAGE_URL_HOME_UAT+actualPage;

			 Assert.assertEquals(pageURL,  driver.getCurrentUrl());
			 System.out.println("user is on the page " + pageURL);
			 return false;
	 }
	
	
	@Then("user is navigated to the {string} page")
	 public boolean user_is_navigated_to_the_page(String actualPage) throws InterruptedException {
	    
		Thread.sleep(5000);
		
		 driver.getCurrentUrl();
		 String pageURL = PAGE_URL_HOME_UAT+actualPage;

			 Assert.assertEquals(pageURL,  driver.getCurrentUrl());
			 System.out.println("user is navigated to this page " + pageURL);
			 return false;
	 }
	
	@When("user selects the {string} button")
	public void user_selects_the_button(String buttonName) throws InterruptedException {
		
		Thread.sleep(2000);
		
		try {
			
			String pageURL = driver.getCurrentUrl();
						
			if(!isNullOrEmpty(buttonName)){
	
				buttonName=buttonName.toLowerCase().trim();
				WebElement linkElement=null;
				
				switch(buttonName){
				
					
					case "let's go":							
						linkElement=getWebElementByXpath(".//button[@class='button--primary-v3']");
//						waitforElementThenClick(driver, linkElement);
						linkElement.click();
						Thread.sleep(30000);
						break;
						
					case "sign up":
						if(pageURL.equalsIgnoreCase(PAGE_NAME_HOME_PAGE) || pageURL.equalsIgnoreCase(PAGE_URL_AWIN)) {	 
							linkElement=getWebElementByXpath(".//nav//div[@class='navigation__right-inner']//following-sibling::li[3]");
							linkElement.click();
							Thread.sleep(2000);
						}else {
							linkElement=getWebElementByXpath(".//button[@id='submit-register']");
							linkElement.click();
							Thread.sleep(4000);
						}
						break;
									
					case "none":
		  				System.out.println("This is option - None");
						break;
						
						//login page submit	
					case "login":
						if(pageURL.equalsIgnoreCase(PAGE_URL_LOGIN)) {	 
							linkElement=getWebElementByXpath(".//button[@class='button--primary-v3']");
							linkElement.click();
							Thread.sleep(20000);
						}else {
							linkElement=getWebElementByXpath(".//nav//div[@class='navigation__right-inner']//following-sibling::li[4]");
							linkElement.click();
							Thread.sleep(1000);
						}
						break;

					//supplier info
					case "gas":
						linkElement = getWebElementByXpath(".//button[@class='supplier-info__mode-button' and text()='Gas']");
						linkElement.click();
						break;
						
					case "electric":
						linkElement = getWebElementByXpath(".//button[@class='supplier-info__mode-button' and text()='Electricity']");
						linkElement.click();
						break;
						
					case "usage":  				
		   				linkElement=getWebElementByXpath(".//button[@class='button--primary-v3']");
		   				linkElement.click();	
						Thread.sleep(20000);
						break;
						
					case "continue":
		   				linkElement=getWebElementByXpath(".//button[@class='button--primary-v3' and text()='Continue']");
		   				linkElement.click();	
		   				Thread.sleep(5000);
						break;
						
					//delayed prompt
					case "submit":
		   				linkElement=getWebElementByXpath(".//button[@id='submit-results-modal']");
		   				linkElement.click();	
		   				Thread.sleep(5000);
						break;
					
					//til
					case "switch now":
		   				linkElement=getWebElementByXpath(".//button[@class='button--primary-v3' and text()='Switch now']");
		   				linkElement.click();	
		   				Thread.sleep(5000);
						break;	
						
					//til
					case "back":
		   				linkElement=getWebElementByXpath(".//div[@class='modal__inner']//button[@class='button--primary-v3']//span[@class='back']");
		   				linkElement.click();	
		   				Thread.sleep(5000);
						break;	
						
					case "home":
						if(pageURL.equalsIgnoreCase(PAGE_URL_ACCOUNTS)) {
							linkElement=getWebElementByXpath(".//a[@class='accounts-page__home-link nuxt-link-active']");
							linkElement.click();
						
						}else if(pageURL.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							linkElement=getWebElementByXpath(".//a[@href='/']//img[@class='logo__logo']");
							linkElement.click();				
						}else {
							linkElement=getWebElementByXpath(".//a[@href='/']/img[@class='funnel-nav__logo']");
							linkElement.click();
						}						
						break;
					
					case "start again":
						linkElement=getWebElementByXpath(".//button[@class='funnel__reset']");
						linkElement.click();
						break;
						
					case "i know my numbers":
						linkElement=getWebElementByXpath(".//button[contains(text(),'I know my numbers')]");
						linkElement.click();
						break;
						
					case "help me estimate":
						linkElement=getWebElementByXpath(".//button[contains(text(),'Help me estimate')]");
						linkElement.click();
						break;    
						
					case "green energy":
						linkElement=getWebElementByXpath(".//label[contains(text(),'Green energy')]");
						linkElement.click();
						break;
						
					case "all deals":
						linkElement=getWebElementByXpath(".//label[contains(text(),'All deals')]");
						linkElement.click();
						break;
					
					//congrats
					case "look at your migration":
						linkElement=getWebElementByXpath(".//button[@class='button--primary']");
						linkElement.click();
						Thread.sleep(2000);
						break;
						
					//prepayment meter prompt	
					case "that's ok - let's continue":
					case "missing payment type":
					case "close meter prompt":	
					case "next":
						linkElement=getWebElementByXpath(".//div[@class='modal']//button[@class='button--primary-v3']");
						linkElement.click();
						Thread.sleep(2000);
						break;
					
					//register page
					case "inactive sign up":
					case "inactive continue":
					case "inactive save usage":
						linkElement=getWebElementByXpath(".//button[@class='button--primary-v3 disabled']");
						linkElement.click();
						break;
						
					case "inactive save details":
						linkElement=getWebElementByXpath(".//button[@class='button--tertiary-v3 disabled']");
						linkElement.click();
						break;
						
					case "edit usage":			
		   				linkElement=getWebElementByXpath(".//div[@class='dashboard__usage-edit']//button[@class='button--tertiary-v3']");
		   				linkElement.click();	
						break;
						
					case "save preferences":	
					case "save usage":	
		   				linkElement=getWebElementByXpath(".//div[@class='dashboard__modal-submit']//button[@class='button--primary-v3']");
		   				Assert.assertTrue("Save usage button should be enabled", linkElement.isEnabled());
		   				linkElement.click();
		   				Thread.sleep(2000);
						break;
						
					case "edit preferences":			
		   				linkElement=getWebElementByXpath(".//div[@class='dashboard__switch-date']//button[@class='button--tertiary-v3']");
		   				linkElement.click();	
						break;
						
					case "close dialog":
					case "close prompt":	
		   				linkElement=getWebElementByXpath(".//button[@class='modal__close']");
		   				linkElement.click();	
						break;
			
					case "save details":
					case "edit details":			
		   				linkElement=getWebElementByXpath(".//div[@class='details__buttons']//button[@class='button--tertiary-v3']");
		   				linkElement.click();	
						break;
						
					case "cancel":		
					case "cancel details":	
		   				linkElement=getWebElementByXpath(".//div[@class='details__buttons']//button[@class='button--tertiary-v3 neutral']");
		   				linkElement.click();	
						break;
					
					//dashboard
					case "log out":	
						linkElement=getWebElementByXpath(".//button[@class='button--tertiary-v3 neutral' and text()='Logout']");
						linkElement.click();
						break;
						
					case "accounts":		
		   				linkElement=getWebElementByXpath(".//a[@class='button--tertiary-v3 dashboard__nav-item' and text()='Accounts']");
		   				linkElement.click();	
						break;
						
					case "add an address":		
		   				linkElement=getWebElementByXpath(".//a[@class='button--secondary-v3' and text()='Add an address']");
		   				linkElement.click();	
						break;
							
					case "til close":		
		   				linkElement=getWebElementByXpath(".//div[@class='modal results-modal']//button[@class='modal__close']");
		   				linkElement.click();	
						break;
					
					case "til back":		
		   				linkElement=getWebElementByXpath(".//button[@class='button--primary-v3']//span[@class='back']");
		   				linkElement.click();	
		   				Thread.sleep(1000);
						break;
						
					case "til submit":		
		   				linkElement=getWebElementByXpath(".//button[@class='button--primary-v3' and text()='Switch now']");
		   				linkElement.click();	
		   				Thread.sleep(2000);
						break;
					
					case "finish your sign up":
					case "finish sign up":
						linkElement=getWebElementByXpath(".//li/a[contains(text(),'Finish your sign up')]");
						linkElement.click();
						Thread.sleep(2000);
						break;
					
					//homepage section 1
					case "finish your sign up 1":
						linkElement=getWebElementByXpath(".//div[@class='advert__copy']/following::a[contains(text(),'Finish your sign up')][1]");
						linkElement.click();
						Thread.sleep(2000);
						break;
						
					//homepage section - help at your fingertips
					case "finish your sign up 2":
						linkElement=getWebElementByXpath(".//div[@class='advert__copy']/following::a[contains(text(),'Finish your sign up')][2]");
						linkElement.click();
						Thread.sleep(2000);
						break;
						
					//homepage section 1
					case "let's get started 1":
						linkElement=getWebElementByXpath(".//div[@class='advert__copy']/following-sibling::a");
						linkElement.click();
						Thread.sleep(2000);
						break;
						
					//homepage section - help at your fingertips
					case "let's get started 2":
						linkElement=getWebElementByXpath(".//div[@class='help__get-started']/a");
						linkElement.click();
						Thread.sleep(2000);
						break;
		
					case "cookie ok":		
		   				linkElement=getWebElementByXpath(".//div[@class='cookie-banner__submit-wrap']//following::button[@class='cookie-banner__submit']");
		   				linkElement.click();	
						break;
																		
					case "privacy cookie ok":		
		   				linkElement=getWebElementByXpath(".//div[@class='cookie-banner']//button[@class='cookie-banner__submit']");
		   				linkElement.click();	
		   				Thread.sleep(1000);
						break;		
						
					//Home page	
					case "get started":
						linkElement = getWebElementByXpath(".//li['navigation__item-wrap--desktop']/following::a[@class='button--tertiary-v3']");
						linkElement.click();	
						Thread.sleep(2000);
						break;	
						
					//homepage links
					case "see all faqs":
						linkElement=getWebElementByXpath(".//div[@class='home-page__faqs']//a[@href='/faqs']");
						linkElement.click();
						Thread.sleep(2000);
						break;
				
					//Home page our mission
					case "get started now":
						linkElement = getWebElementByXpath(".//div[@class='touch__funnel-link']/a");
						linkElement.click();	
						Thread.sleep(2000);
						break;		
								
					case "congrats close":
						linkElement = getWebElementByXpath(".//div[@class='popup__inner']//button[@class='popup__corner-close']");
						linkElement.click();	
						Thread.sleep(2000);
						break;		
					
					case "edit supply address":
						linkElement = getWebElementByXpath(".//div[@id='select-supply-address']//following-sibling::button[1]");
						linkElement.click();	
						Thread.sleep(2000);
						break;		
						
					case "edit second address":
						linkElement = getWebElementByXpath(".//div[@id='select-second-address']//following-sibling::button[1]");
						linkElement.click();	
						Thread.sleep(5000);
						break;		
						
					case "edit third address":
						linkElement = getWebElementByXpath(".//div[@id='select-third-address']//following-sibling::button[1]");
						linkElement.click();	
						Thread.sleep(2000);
						break;		
						
					case "edit billing address":
						linkElement = getWebElementByXpath(".//div[@id='select-billing-address']//following-sibling::button[1]");
						linkElement.click();	
						Thread.sleep(2000);
						break;		
						
						
						
					default:
						Assert.fail("\nThe " + buttonName + " button has not been recognised");
						break;
					}
						System.out.println("Selects the button name "+buttonName);	
				}	
			
		}catch(Exception e) {
				
				Assert.fail("There has been an error selecting this button " + buttonName + "");
		}
	}
	
	@When("user selects the {string} radio button")
	public void user_selects_the_radio_button(String radioName) throws InterruptedException {
		
		Thread.sleep(2000);
		
		try {
			
			String pageURL = driver.getCurrentUrl();
			if(!isNullOrEmpty(radioName)){
	
				radioName=radioName.toLowerCase().trim();
				WebElement linkElement=null;
				
				switch(radioName){
							   			
					case "same supplier yes":
						linkElement=getWebElementByXpath(".//input[@id='same-supplieryes']");
						linkElement.click();
						break;
						
					case "same supplier no":
						linkElement=getWebElementByXpath(".//input[@id='same-supplierno']");
						linkElement.click();
						break;
						
					case "econ meter yes":
						linkElement=getWebElementByXpath(".//input[@id='econ7yes']/following-sibling::span[@class='boolean-radio__fake-radio']");
						linkElement.click();
						break;
						
					case "econ meter no":
						linkElement=getWebElementByXpath(".//input[@id='econ7no']/following-sibling::span[@class='boolean-radio__fake-radio']");
						linkElement.click();
						break;
						
					case "prepayment meter yes":
						linkElement=getWebElementByXpath(".//input[@id='prepaymentyes']/following-sibling::span[@class='boolean-radio__fake-radio']");
						linkElement.click();
						break;
						
					case "prepayment meter no":
						linkElement=getWebElementByXpath(".//input[@id='prepaymentno']/following-sibling::span[@class='boolean-radio__fake-radio']");
						linkElement.click();
						break;					
						
					case "i spend elec":
						linkElement=getWebElementByXpath(".//input[@id='elec-spend-mode-on']/following-sibling::span[@class='radio__fake-radio']");
						linkElement.click();
						break;
						
					case "i use elec":
						linkElement=getWebElementByXpath(".//input[@id='elec-spend-mode-off']/following-sibling::span[@class='radio__fake-radio']");
						linkElement.click();
						break;
					    
					case "i spend gas":
						linkElement=getWebElementByXpath(".//input[@id='gas-spend-mode-on']/following-sibling::span[@class='radio__fake-radio']");
						linkElement.click();
						break;
						
					case "i use gas":
						linkElement=getWebElementByXpath(".//input[@id='gas-spend-mode-off']/following-sibling::span[@class='radio__fake-radio']");
						linkElement.click();
						break;
					    					
					case "ratings":
						linkElement=getWebElementByXpath(".//input[@id='csr']/following-sibling::span[@class='checkbox__fake-checkbox']");
						linkElement.click();
						break;
						
					case "whd":
						linkElement=getWebElementByXpath(".//input[@id='warm-home']/following-sibling::span[@class='checkbox__fake-checkbox']");
						linkElement.click();
						break;
						
					case "paper billing":
						if(pageURL.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							linkElement=getWebElementByXpath(".//*[@class='dashboard__modal']//input[@id='paperBilling']/ancestor::div[@class='checkbox'] ");
							linkElement.click();	
						}else {
							linkElement=getWebElementByXpath(".//input[@id='paper-billing']/following-sibling::span[@class='checkbox__fake-checkbox']");
							linkElement.click();		
						}
						break;
						
					case "t&cs":
						linkElement=getWebElementByXpath(".//div[@class='checkbox__wrap register__terms']//following-sibling::span[@class='checkbox__fake-checkbox']");
						linkElement.click();
						break;
					
					case "third party t&cs":
						linkElement=getWebElementByXpath(".//input[@id='thirdPartyConsent']/following::span[@class='checkbox__fake-checkbox']");
						linkElement.click();
						break;
					
					case "switch now":
						WebElement switchNow = getWebElementByXpath(".//div[@class='modal']//input[@id='switch-now']/following-sibling::span[@class='radio__fake-radio']");
						switchNow.click();			
						break;
					
					case "switch later":
						WebElement switchLater = getWebElementByXpath(".//div[@class='modal']//input[@id='switch-later']/following-sibling::span[@class='radio__fake-radio']");
						switchLater.click();				
						break;
					
					case "none":
						System.out.println("Selcting None radio button");			
						break;
					
					default:
						Assert.fail("\nThe " + radioName + " button is disabled");
						break;
					}
						System.out.println("Selects the button name "+radioName);	
				}	
			
		}catch(Exception e) {
				
				Assert.fail("There has been an error selecting this button " + radioName + ", please check the feature file");
		}
	}

	@When("user selects the {string} link")
	 public void user_selects_the_link(String linkSelected) throws InterruptedException {
    		    	
    	Thread.sleep(1000);
    	
	    try {
	    	
	    	if(!isNullOrEmpty(linkSelected)){
	    		
	    		linkSelected=linkSelected.toLowerCase().trim();
	    		WebElement linkElement = null;
	    							
	    	switch (linkSelected) {		
	    				    	
				case "none":
					System.out.println("No link to select");
					break;
				
	    	//dashboard
				case "prepayment contact us":
					driver.findElement(By.linkText("directly")).click();
					break;
				
				//prepayment prompt
				case "here":
					linkElement=getWebElementByXpath(".//p[@class='paragraph']/a");
					linkElement.click();
					break;
					
				//header links- desktop
				case "dashboard":
					linkElement=getWebElementByXpath(".//ul[@class='navigation__items']//a[@href='/dashboard']");
					linkElement.click();
					break;
					
				case "accounts":
					linkElement=getWebElementByXpath(".//a[@class='navigation__item--green' and text()='Accounts']");
					linkElement.click();
					break;
				
				case "our mission":		
					linkElement=getWebElementByXpath(".//ul[@class='navigation__items']/li/button[contains(text(),'Our mission')]");
	   				linkElement.click();
					break;
					
				case "about us":
					linkElement=getWebElementByXpath(".//div[@class='navigation__dropdown']//li/a[@href='/about']");
					linkElement.click();
					break;	
					
				case "fuel poverty":
					linkElement=getWebElementByXpath(".//div[@class='navigation__dropdown']//li/a[@href='/fuel-poverty']");	
					linkElement.click();
					break;	
											
				case "help":		
					linkElement=getWebElementByXpath(".//ul[@class='navigation__items']/li/button[contains(text(),'Help')]");	
	   				linkElement.click();
					break;
					
				case "faqs":		
					linkElement=getWebElementByXpath(".//div[@class='navigation__dropdown']//li/a[@href='/faqs']");	
	   				linkElement.click();
					break;		
					
				case "contact us":		
	   				linkElement=getWebElementByXpath(".//div[@class='navigation__dropdown']//li/a[@href='/contact-us']");	
	   				linkElement.click();
					break;
					
				case "blog":		
					linkElement=getWebElementByXpath(".//ul[@class='navigation__items']//a[@href='/blog']");
					linkElement.click();	
					break;	
				
				case "log in":		
					linkElement=getWebElementByXpath(".//ul[@class='navigation__items']//a[@href='/login']");
	   				linkElement.click();	
					break;
					
				case "logout":	
					driver.switchTo().defaultContent();
					linkElement=getWebElementByXpath(".//button[@class='button navigation__item--green' and text()='Logout']");
					linkElement.click();
					break;
					
				//footer link in supplier t&cs	
				case "supplier t&cs":		
	   				linkElement=getWebElementByXpath(".//div[@class='modal results-modal']//p[@class='paragraph centered']/a");
	   				linkElement.click();	
	   				Thread.sleep(2000);
					break;

				//footer links- desktop
				case "about us footer":		
	   				linkElement=getWebElementByXpath(".//li[@class='footer__link']//a[@href='/about']");
	   				linkElement.click();	
					break;		
					
				case "fuel poverty footer":		
					linkElement=getWebElementByXpath(".//li[@class='footer__link']//a[@href='/fuel-poverty']");
					linkElement.click();
	   				Thread.sleep(2000);
					break;		
					
				case "faqs footer":		
	   				linkElement=getWebElementByXpath(".//li[@class='footer__link']//a[@href='/faqs']");
	   				linkElement.click();	
					break;		
					
				case "contact us footer":		
	   				linkElement=getWebElementByXpath(".//li[@class='footer__link']//a[@href='/contact-us']");
	   				linkElement.click();	
					break;		
					
				case "t&cs footer":		
	   				linkElement=getWebElementByXpath(".//li[@class='footer__link']//a[@href='/terms-and-conditions']");
	   				linkElement.click();	
					break;		
		
				case "privacy policy footer":		
	   				linkElement=getWebElementByXpath(".//li[@class='footer__link']//a[@href='/privacy-policy']");
	   				linkElement.click();	
					break;	
					
				//privacy policy link
				case "cookie privacy policy":		
	   				linkElement=getWebElementByXpath(".//div[@class='cookie-banner']//a[@name='privacy policy']");
	   				linkElement.click();	
					break;		
	
				//footer social media links
				case "facebook footer":
					linkElement = getWebElementByXpath(".//li[@class='footer__link--social-media']//*[@id='facebook-footer']");
					linkElement.click();	
					Thread.sleep(2000);
					break;	
					
				case "twitter footer":
					linkElement = getWebElementByXpath(".//li[@class='footer__link--social-media']//*[@id='twitter-footer']");
					linkElement.click();	
					Thread.sleep(2000);
					break;	
					
				case "linkedin footer":
					linkElement = getWebElementByXpath(".//li[@class='footer__link--social-media']//*[@id='linked-in-footer']");
					linkElement.click();	
					Thread.sleep(5000);
					break;		
									
				case "enter your address manually":
				case "select your address from the list":
					linkElement = getWebElementByXpath(".//button[@class='register__manual-address-toggle']");
					linkElement.click();	
					Thread.sleep(1000);
					break;	
				
				case "enter your second address manually":
				case "select your second address from the list":
					Thread.sleep(1000);
					linkElement = getWebElementByXpath(".//*[@id='select-second-address']//following::button[1]");
					linkElement.click();	
					Thread.sleep(1000);
					break;						
				
				case "enter your third address manually":
				case "select your third address from the list":
					linkElement = getWebElementByXpath(".//div[@id='select-third-address']//following::button[1]");
					linkElement.click();	
					Thread.sleep(1000);
					break;		
								
				case "enter your billing address manually":
				case "select your billing address from the list":
					linkElement = getWebElementByXpath(".//div[@id='select-billing-address']//following::button[1]");
					linkElement.click();	
					Thread.sleep(1000);
					break;		
										
				//register page
				case "t&cs":		
	   				linkElement=getWebElementByXpath(".//a[@href='/terms-and-conditions']");
	   				linkElement.click();	
					break;		
					
				case "electric meter more info":		
	   				linkElement=getWebElementByXpath(".//img[@alt='electricity meter information']/following::button[1]");
	   				linkElement.click();	
					break;		
					
				case "gas meter more info":		
	   				linkElement=getWebElementByXpath(".//img[@alt='electricity meter information']/following::button[2]");
	   				linkElement.click();	
					break;		
					
				case "facebook":		
	   				linkElement=getWebElementByXpath(".//ul[@class='refer__social-items']/li[1]");
	   				linkElement.click();	
					break;		
					
				case "whats app":		
	   				linkElement=getWebElementByXpath(".//ul[@class='refer__social-items']/li[2]");
	   				linkElement.click();	
					break;		
					
				case "twitter":		
	   				linkElement=getWebElementByXpath(".//ul[@class='refer__social-items']/li[3]");
	   				linkElement.click();	
					break;							
				
				case "forgot password":		
	   				linkElement=getWebElementByXpath(".//a[@href='/forgot-password']");
	   				linkElement.click();	
					break;					
						
				default:
					Assert.fail(linkSelected+" link is currently not recognised");
					break;
		    		}
	    	
		    	} 	System.out.println("Selects the " +linkSelected+" link");
		    	
		    }catch(Exception e) {
		    		
		    		Assert.fail("Could not find the link to click on "+linkSelected);
		    }
	    }
	 
	//Login Page
		 
	 @When("user enters their email {string}")
		public void user_enters_their_email(String email) throws InterruptedException {
			
			WebElement emailField = driver.findElement(By.cssSelector("#emailAddress"));
			emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			emailField.sendKeys(email);
			
			switch (email) {
			case "elec econ pre":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(DASHBOARD_ELEC_ECON_PRE_VAR_USER);
				break;
				
			case "dual econ":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(DASHBOARD_DUAL_ECON_USER);
				break;
				
			case "dual":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(DASHBOARD_DUAL_ECON_USER);
				break;
				
			case "elec":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(DASHBOARD_ELEC_PRE_USER);
				break;
				
			case "returning":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(RETURNING_USER);
				break;
				
			case "test unknown address":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(TEST_UNKNOWN_ADDRESS_USER);
				break;
				
			case "dashboard user":
				emailField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
				emailField.sendKeys(DASHBOARD_DUAL_ECON_USER);
				break;
				
			case "None":
				System.out.println("User has not entered an email address");
				break;
				
				
				
				
				
			default:
				break;
			}

		}
	
	@When("user enters a new user email {string}")
	public static void user_enters_a_new_user_email(String email) {
				
		SimpleDateFormat dateFormat=new SimpleDateFormat("ddHHmmss");
		String dateStr=dateFormat.format(new java.util.Date());
		
		int atPosition = email.indexOf("@");
		String preAtString = email.substring(0, atPosition);
		String postAtString = email.substring(atPosition, email.length());
		String newEmail = preAtString + dateStr + postAtString;

			WebElement emailFieldCA = driver.findElement(By.id("emailAddress"));
			emailFieldCA.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			emailFieldCA.sendKeys(newEmail);	
			System.out.println("Emails is "+ newEmail);
	}


	@When("user enters their password {string}")
	public void user_enters_their_password(String password) throws InterruptedException {

		try {
			
			WebElement passwordFieldCA = driver.findElement(By.id("password"));
			passwordFieldCA.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			passwordFieldCA.sendKeys(password);	
			
		}catch(Exception e) {
				
				Assert.fail("Unable to locate the password field "+password);
			}
		}
	
	@Given("user enters their confirm password {string}")
	public void user_enters_their_confirm_password(String confirmPassword) {
		
		try{
			
			WebElement confirmPasswordField = driver.findElement(By.id("passwordConfirm"));
			confirmPasswordField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			confirmPasswordField.sendKeys(confirmPassword);
		
		}catch(Exception e) {
			
			Assert.fail("Unable to locate the confirm password field "+confirmPassword);
		}
	}
	

	@Then("user sees validation message for {string} {string}")
	public void user_sees_validation_message_for(String field, String expectedValidation) {
	  
		try {
			
			Thread.sleep(2000);
			
			field = field.toLowerCase().trim();
			String actualValidation = "";
			
			switch (field) {
			case "agent t&cs":
				actualValidation = getWebElementByXpath(".//*[@class='form-control__error static']").getText();
				System.out.println("Actual checkbox validation is "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;

			case "postcode":
				actualValidation = getWebElementByXpath(".//p[@class='form-control__error big-margin']").getText();
				System.out.println("Actual postcode validation is "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			case "direct debit":
				actualValidation = getWebElementByXpath(".//p[@class='form-control__error static direct-debit__error']").getText();
				System.out.println("Actual Direct Debit validation is "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			case "dob":
				actualValidation = getWebElementByXpath(".//p[@class='form-control__error static register__server-error']").getText();
				System.out.println("Actual DOB validation is "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			case "t&cs":
				actualValidation = getWebElementByXpath(".//p[@class='form-control__error static']").getText();
				System.out.println("Actual T&Cs validation is "+ actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			case "prepayment meter":
				actualValidation = getWebElementByXpath(".//*[@class='form-control__error margin']").getText();
				System.out.println("Actual validation "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			case "server error register":
				actualValidation = getWebElementByXpath(".//*[@class='form-control__error static register__server-error']").getText();
				System.out.println("Actual validation "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			case "forgot password":
				actualValidation = getWebElementByXpath(".//*[@class='form-control__error green']").getText();
				System.out.println("Actual validation "+actualValidation);	
				Assert.assertEquals(expectedValidation, actualValidation); 
				break;
				
			default:
				Assert.fail("Did not recognise field "+field+" and validation message "+ expectedValidation);
				break;
			}
	
		}catch(Exception e) {
			
    		Assert.fail("An error occured with validating message "+ expectedValidation +" in field "+field);
	    }			
	}
	
	
	@Then("user sees validation message {string}")
	public void user_sees_validation_message(String expectedValidation) throws InterruptedException {
	
		Thread.sleep(2000);
		
		try {		
			
			 if(expectedValidation.equalsIgnoreCase("None")) {
					 
					 System.out.println("No Validation message to check");
					 Assert.assertEquals(expectedValidation, "None");

					 }else {
							
						String actualValidation = getWebElementByXpath(".//*[@class='form-control__error']").getText();
						System.out.println("Actual validation "+actualValidation);	
						Assert.assertEquals(expectedValidation, actualValidation); 
					 }
						 
		}catch(Exception e) {
			
	        	Assert.fail("The expected validation message is not correct "+ expectedValidation);
	    }		
	}
		
	@Then("user sees a list of validation messages")
	public void user_sees_a_list_of_validation_messages(List<String> expectedValidation) throws InterruptedException {
			
		Thread.sleep(1000);
		
		if(expectedValidation.size() > 0){
			
			List<WebElement> listItems = driver.findElements(By.xpath(".//*[@class='form-control__error']"));
		    List <String> actualItems = new ArrayList<String>();

		    for(int i=0;i<listItems.size();i++)
		    {
		     	actualItems.add(listItems.get(i).getText());
    
		    }	
		    	System.out.println("Printing expected "+expectedValidation);	        
		        System.out.println("Printing actual "+actualItems);
		    	Assert.assertEquals(expectedValidation, actualItems);
		}
	}

	//Sign Up
	@Given("user logs in as a {string} user {string},{string},{string}")
	public void user_logs_in_as_a_user(String user, String email, String password, String buttonName) throws InterruptedException {
	    
		try {
			
			user_navigates_to("login");
			
			if(isElementPresent(By.xpath(".//div[@class='cookie-banner']"))) {		
			
				user_selects_the_button("cookie ok");
				user_enters_their_email(email);
				user_enters_their_password(password);
				user_selects_the_button(buttonName);
			
			}else if(!isElementPresent(By.xpath(".//div[@class='cookie-banner']"))) {	
		
				user_enters_their_email(email);
				user_enters_their_password(password);
				user_selects_the_button(buttonName);
			
			}
		
		}catch (Exception e) {
			Assert.fail("Error validating cookie banner");
		}
		
	}

	@Given("I am a new user type with known postcode {string},{string},{string},{string}")
	public void I_am_a_new_user_type_with_known_postcode(String expectedTitle, String postcode, String typeOfUser, String buttonName) throws InterruptedException {
	    
		try {
			
			user_navigates_to("signup");
			 
			if(isElementPresent(By.xpath(".//div[@class='cookie-banner']"))) {		
		
				 user_selects_the_button("cookie ok");
				 user_validates_the_page_heading(expectedTitle);
				 user_enters_their_postcode(postcode);
				 user_selects_the_type_of_user_button(typeOfUser);
				 user_selects_the_button(buttonName);
		
			}else if(!isElementPresent(By.xpath(".//div[@class='cookie-banner']"))) {		
				
				 user_validates_the_page_heading(expectedTitle);
				 user_enters_their_postcode(postcode);
				 user_selects_the_type_of_user_button(typeOfUser);
				 user_selects_the_button(buttonName);
				
			}
		}catch (Exception e) {
			Assert.fail("Error validating cookie banner");
		}
	}
	
	@Given("I am a new user type with unknown postcode {string},{string},{string},{string},{string}")
	public void I_am_a_new_user_type_with_unknown_postcode(String expectedTitle, String postcode, String typeOfUser, String region, String buttonName) throws InterruptedException {
		
		try {
			
			user_navigates_to("signup");
			 
			if(isElementPresent(By.xpath(".//div[@class='cookie-banner']"))) {		
		
				 user_selects_the_button("cookie Ok");
				 user_validates_the_page_heading(expectedTitle);
				 user_enters_their_postcode(postcode);
				 user_selects_the_type_of_user_button(typeOfUser);
				 user_selects_the_region(region);
				 user_selects_the_button(buttonName);
		
			}else if(!isElementPresent(By.xpath(".//div[@class='cookie-banner']"))) {		
				
				 user_validates_the_page_heading(expectedTitle);
				 user_enters_their_postcode(postcode);
				 user_selects_the_type_of_user_button(typeOfUser);
				 user_selects_the_region(region);
				 user_selects_the_button(buttonName);
				
			}
			
		}catch (Exception e) {
			Assert.fail("Error validating cookie banner");
		}
	}
			
		
	@When("user selects the {string} type of user button")
	public void user_selects_the_type_of_user_button(String typeOfUser) {
	 
		try {
			
			typeOfUser=typeOfUser.toLowerCase().trim();
			
			if (IHaveABillToHand.equalsIgnoreCase(typeOfUser)){
				driver.findElement(By.xpath(".//input[@id='bill-estimate-1']")).click();
				
				}else if(NoBillToHand.equalsIgnoreCase(typeOfUser)) {
//					driver.findElement(By.xpath(".//input[@id='no-bill-to-hand']")).click();
					WebElement noBill = driver.findElement(By.cssSelector("input#bill-estimate-2"));
							noBill.click();
					
					}else if(RecentlyMoved.equalsIgnoreCase(typeOfUser)) {
						driver.findElement(By.xpath(".//input[@id='bill-estimate-3']")).click();
						}
		
		}catch(Exception e) {

	    		Assert.fail("The " + typeOfUser + " type of user is not correct ");
			
		}
	}
	
	@When("user enters their postcode {string}")
	public void user_enters_their_postcode (String postcode) throws InterruptedException {
	
		WebElement postCodeField = driver.findElement(By.xpath(".//*[@id='start-signup-postcode']"));
		postCodeField.sendKeys(postcode);
		
		System.out.println("Entering postcode "+postcode);

	}
		
	//submit button 
	@Then("the {string} button appears {string}")
	public void the_button_appears(String buttonName, String statusOfButton) throws InterruptedException {
	 
		Thread.sleep(2000);
	
		try {
			
			if(!isNullOrEmpty(buttonName)){
				
			buttonName=buttonName.toLowerCase().trim();
			statusOfButton=statusOfButton.trim();
			
			switch (buttonName) {
			
			case "let's go":
				
				if(statusOfButton.equalsIgnoreCase("enabled")) {
					
					WebElement submitButton = driver.findElement(By.xpath(".//button[@class='button--primary-v3']"));					
					Assert.assertTrue("The button is appearing disabled but should appear enabled", submitButton.isEnabled());
				
				}else if(statusOfButton.equalsIgnoreCase("disabled")) { 
					
					WebElement submitButtonDisabled = driver.findElement(By.xpath(".//button[@class='button--primary-v3 disabled']"));
					Assert.assertFalse("The button is appearing enabled but should appear disabled", submitButtonDisabled.isEnabled());
					
				}else {
					
					Assert.fail("The status of the button has not been recognised "+buttonName);
				}
				break;
	
			default:
				//the buttonName has not been recognised
				Assert.fail("\nThe " + buttonName + " button has not been recognised.");
				break;
			}
		}
		
		}catch(Exception e) {
			
			Assert.fail("An error occured with validating the button "+buttonName);
			
		}
	}

	
	@Then("user sees the {string} supplier page")
	public void user_sees_the_supplier_page(String typeOfUser) {

		try {
			
			typeOfUser=typeOfUser.toLowerCase().trim();
			
			switch (typeOfUser) {
			case "i have a bill to hand":
				Assert.assertTrue(isElementPresent(By.xpath(".//div[@id='dual-supplier-tariff']")));
				break;
				
			case "no bill to hand":
				Assert.assertEquals(false, isElementPresent(By.xpath(".//div[@id='dual-supplier-tariff']")));
				break;
				
			case "recently moved in":
				Assert.assertEquals(true, isElementPresent(By.id("prepaymentno")));	
				break;

			default:
				Assert.fail("Option not recognised");
				break;
			}
			
		
		}catch(Exception e) {
			
				Assert.fail("An error occured with detecting the supplier page "+typeOfUser);
		}
	}

	
	@Given("user has selected an energy type {string}")
	 public void user_has_selected_an_energy_type(String energyType) throws InterruptedException {
	    
		 user_selects_top_nav_icon("Energy");
		 user_selects_energy_type(energyType);
		 user_selects_the_button("Continue");
	 }
	 

	@Then("user validates the page heading {string}")
	public void user_validates_the_page_heading(String expectedTitle) throws InterruptedException {
		
		Thread.sleep(1000);
		
		try {
			
			if(!isNullOrEmpty(expectedTitle)){
			
			String actualTitle = driver.findElement(By.tagName("h1")).getText();
			
			if(expectedTitle.equalsIgnoreCase(actualTitle)) {
				Assert.assertEquals(expectedTitle, actualTitle);
				System.out.println("Actual page heading h1 is "+actualTitle +" and expected page heading is "+expectedTitle);
		
			}else {
					Assert.fail("The page heading does not match - expected page heading "+expectedTitle +" actual page heading was "+actualTitle);
			}
		}
				
		}catch(Exception e) {
			
			Assert.fail("An error occured with validating expected page heading "+expectedTitle);
		}
	}
		
		
	 @When("user selects {string} energy type")
	 public static void user_selects_energy_type(String energyType) {
		 		
		try {
			
			energyType=energyType.toLowerCase().trim();
			
			switch (energyType) {
			case "electric":
				driver.findElement(By.xpath(".//input[@id='electricity']")).click();
				break;
			
			case "gas & electric":
			case "dual":
				driver.findElement(By.xpath(".//input[@id='gas-and-electric']")).click();
				break;
				
			default: 
				Assert.fail("The option was not recognised "+energyType);
				break;
			}
			
				System.out.println("User has selected energy type "+energyType);
		
		}catch(Exception e) {

			Assert.fail("An error has occured selecting energy type "+energyType);
		}
	 }

	 //todo
	 @Then("the energy image appears {string}")
	 public void the_energy_image_appears(String active) throws InterruptedException {
	
		Thread.sleep(2000);
		WebElement statusOfImage = driver.findElement(By.xpath(".//label[@class='energy-type__inner']"));
		
		if(active.equalsIgnoreCase("active")) {
			
			System.out.println("Energy enabled");
			Assert.assertTrue("image is enabled ", statusOfImage.isEnabled());
			
		}else {
			System.out.println("Energy disabled");
			Assert.assertFalse("image is disabled ", statusOfImage.isEnabled());
			
		}			
	 }
	 
	 @When("user selects top nav icon {string}")
	 public void user_selects_top_nav_icon(String topNavIcon) throws InterruptedException {
		
		 Thread.sleep(2000);
	
		 try {
		 		
			if(!isNullOrEmpty(topNavIcon)){
				
				topNavIcon=topNavIcon.toLowerCase().trim();
				WebElement linkElement=null;
				switch(topNavIcon){
				
					case "energy":
						linkElement=getWebElementByXpath(".//li[@class='funnel-nav__item-wrap']//span[contains(text(),'Energy')]");
						linkElement.click();
						break;
						
					case "supplier":
						linkElement=getWebElementByXpath(".//li[@class='funnel-nav__item-wrap']//span[contains(text(),'Supplier')]");
						linkElement.click();
						break;
						
					case "usage":
						linkElement=getWebElementByXpath(".//li[@class='funnel-nav__item-wrap']//span[contains(text(),'Usage')]");
						linkElement.click();
						break;
						
					case "switch":				
						linkElement=getWebElementByXpath(".//li[@class='funnel-nav__item-wrap']//span[contains(text(),'Switch')]");
						linkElement.click();
						break;	
						
					default:
						Assert.fail("Unable to select top nav icon "+topNavIcon +", check feature file");
						break;	
				}
			}
				System.out.println("selecting top nav icon "+topNavIcon);
			
		 }catch(Exception e) {
		 		
		 		Assert.fail("Error with selecting the top nav icon "+ topNavIcon);
		 	}
		}
	 
//	 Supplier info	 
	 @When("user selects a supplier and tariff and payment method") //table headings down
	 public void user_selects_a_supplier_and_tariff_and_payment_method(Map<String, String> formItems) throws InterruptedException {
				   
		 try {		 
		 
			   for(Map.Entry<String, String> entry : formItems.entrySet()){
				   
				   String key=entry.getKey();
				   String val=entry.getValue();
				   
				   if(!isNullOrEmpty(key)){
					   key=key.replaceAll("^'(.*?)'$", "$1");
					   key=key.toLowerCase().trim();
				   }
				   
				   if(!isNullOrEmpty(val)){
					   val=val.replaceAll("^'(.*?)'$", "$1");
				   }
				   
				   WebElement formEle=null;
				   String GasSupplierPage = "Gas";
		   		   String ElectricSupplierPage = "Electricity";
		   		   
		   		   Thread.sleep(2000);
		   		   
				   switch(key){
				   		
			   		case "supplier":	   	
			   		 if(isElementPresent(By.xpath(".//button[@class='supplier-info__mode-button active']"))){
				   		 
			   			   String buttonName = driver.findElement(By.xpath(".//button[@class='supplier-info__mode-button active']")).getText();
			   			   
				   			if (GasSupplierPage.equalsIgnoreCase(buttonName)){	
				   				
					   			driver.findElement(By.id("gasSupplier")).click();	
					   			formEle=driver.findElement(By.xpath(".//li[contains(text(),'"+val+"')]"));
					   			formEle.click();
				   			
					   			}else if(ElectricSupplierPage.equalsIgnoreCase(buttonName)) {
					   				
				   					driver.findElement(By.id("elecSupplier")).click();			
						   			formEle=driver.findElement(By.xpath(".//li[contains(text(),'"+val+"')]"));	   		
						   			formEle.click();			   			
						   		}
					   				they_enter_their_details(val);
			   		 		}	
				   			break;
			   	
			   		case "tariff":
			   		 if(isElementPresent(By.xpath(".//button[@class='supplier-info__mode-button active']"))){
				   		 
			   			   String buttonName = driver.findElement(By.xpath(".//button[@class='supplier-info__mode-button active']")).getText();
			   			
					   		  if(ElectricSupplierPage.equalsIgnoreCase(buttonName)) {
				   				 
					   			  	driver.findElement(By.id("elec-supplier-tariff")).click();	
					   				they_enter_their_details(val);
					   				the_supplier_dropdown_displays_supplier("elec tariff", val);
					   			  	
					   		  		}else if (GasSupplierPage.equalsIgnoreCase(buttonName)){
						   			  	
					   		  			driver.findElement(By.id("gas-supplier-tariff")).click();	
							   			they_enter_their_details(val);
						   				the_supplier_dropdown_displays_supplier("gas tariff", val);
							   		
					   		  		}
			   		 			}			
				   				break;
			   		
				   		case "payment":
				   		 if(isElementPresent(By.xpath(".//button[@class='supplier-info__mode-button active']"))){
					   		 
				   			   String buttonName = driver.findElement(By.xpath(".//button[@class='supplier-info__mode-button active']")).getText();
				   			
					   			 if(ElectricSupplierPage.equalsIgnoreCase(buttonName)) {
				   				  
						   			 driver.findElement(By.id("elec-payment-method")).click();	
						   			 they_enter_their_details(val);
						   			 the_supplier_dropdown_displays_supplier("elec payment", val);
					   			 
						   			 } else if(GasSupplierPage.equalsIgnoreCase(buttonName)) {
						   				 
						   				 driver.findElement(By.id("gas-payment-method")).click();	
						   				 they_enter_their_details(val);
						   				 the_supplier_dropdown_displays_supplier("gas payment", val);
						   			 }
				   		 		}		
			   					break;		
				   				
				   		case "dual supplier":	   			
				   			driver.findElement(By.xpath(".//div[@id='dualSupplier']/button")).click();	
				   			formEle=driver.findElement(By.xpath(".//li[contains(text(),'"+val+"')]"));
				   			formEle.click();
				   			break;
				   			
				   		case "dual tariff":
			   			  	driver.findElement(By.id("dual-supplier-tariff")).click();					   				 					
			   				they_enter_their_details(val);
			   				the_supplier_dropdown_displays_supplier(key, val);
				   			break;
				   			
				   		case "dual payment":
			   			  	driver.findElement(By.id("dual-payment-method")).click();					   				 					
			   				they_enter_their_details(val);		
			   				the_supplier_dropdown_displays_supplier(key, val);
				   			break;
				   			
				   		case "elec supplier":	   			
				   			driver.findElement(By.xpath(".//div[@id='elecSupplier']/button")).click();	
				   			formEle=driver.findElement(By.xpath(".//li[contains(text(),'"+val+"')]"));
				   			formEle.click();		
				   			break;
			   			
				   		case "elec tariff":
			   			  	driver.findElement(By.id("elec-supplier-tariff")).click();					   				 					
			   				they_enter_their_details(val);
			   				the_supplier_dropdown_displays_supplier(key, val);				
				   			break;
			   			
				   		case "elec payment":
			   			  	driver.findElement(By.id("elec-payment-method")).click();					   				 					
			   				they_enter_their_details(val);
			   				the_supplier_dropdown_displays_supplier(key, val);
				   			break;
			   							   			 
				   		 default:
				   			Assert.fail("Supplier field not recognised " +key);
				   			break;
				   }	
			}
			
		 }catch(Exception e) {
			 
			 Assert.fail("Unable to select dropdown on supplier page "+formItems );
		 }
	 }
	  
	 //TODO
		//supplier values are displayed but doesn't work for supplier fields
		@Then("the supplier dropdown {string} displays value {string}")
		public void the_supplier_dropdown_displays_supplier(String energyType, String fieldValue) throws InterruptedException {
		   
			Thread.sleep(2000);
		    
			try {
				
				String actualfieldValue = "";
				energyType=energyType.toLowerCase().trim();
				
				if(!isNullOrEmpty(fieldValue)) {
					
					switch (energyType) {
					case "gas supplier":
						driver.findElement(By.xpath(".//div[@id='gasSupplier']/button")).click();	
						actualfieldValue = getWebElementByXpath(".//div[@id='gasSupplier']/span[@class='hidden-select__item--active']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);
						break;
						
					case "gas tariff":
						actualfieldValue = getWebElementByXpath(".//div[@id='gas-supplier-tariff']//span[@class='vs__selected']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);
						break;
						
					case "gas payment":
						actualfieldValue = getWebElementByXpath(".//div[@name='gas-payment-method']//span[@class='vs__selected']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);
						break;

					case "elec supplier":
						actualfieldValue = getWebElementByXpath(".//div[@id='elecSupplier']//*[@class='hidden-select__item--active']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);					
						break;
						
					case "elec tariff":
						actualfieldValue = getWebElementByXpath(".//div[@id='elec-supplier-tariff']//span[@class='vs__selected']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);					
						break;
						
					case "elec payment":
						actualfieldValue = getWebElementByXpath(".//div[@id='elec-payment-method']//span[@class='vs__selected']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);		   					
						break;
						
					case "dual supplier":	
						actualfieldValue = getWebElementByXpath(".//div[@id='dualSupplier']//*[@class='hidden-select__item--active']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);				
						break;
						
					case "dual tariff":
						actualfieldValue = getWebElementByXpath(".//div[@id='dual-supplier-tariff']//span[@class='vs__selected']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);				
						break;
						
					case "dual payment":
						actualfieldValue = getWebElementByXpath(".//div[@id='dual-payment-method']//span[@class='vs__selected']").getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);				
						break;
					
					case "paper billing":
						actualfieldValue = driver.findElement(By.name("How would you like migrate to communicate with you for future energy switches")).getText();
						Assert.assertEquals(energyType, fieldValue, actualfieldValue);				
						break;
					
					default:
						Assert.fail("The actual field value was not recognised  "+fieldValue +" "+energyType);
						break;
					}				
					
				}else {
					
					Assert.fail("Could not validate the supplier field, was not recognised  "+fieldValue +""+energyType);
				
				} 	System.out.println("Actual value displayed in supplier field is "+fieldValue+" and the energy type is "+energyType);
				
			}catch(Exception e) {
				
				Assert.fail("An error occured with validating the supplier type "+energyType+" and energy type is "+fieldValue);
			}
		}
	 
	@When("user selects their energy supplier information") //table headings across
	public void user_selects_their_energy_supplier_information(DataTable data) throws InterruptedException {
		
		 try {
			 List<Map<String, String>> content = data.asMaps(String.class, String.class);
			    for (Map<String, String> row : content) {
			        for (Entry<String, String> entry : row.entrySet()) {
			        	
			            String key = entry.getKey();
			            String val = entry.getValue();
			            
			            if(!isNullOrEmpty(key)){
							   key=key.replaceAll("^'(.*?)'$", "$1");
							   key=key.toLowerCase().trim();
						   }
						   
						   if(!isNullOrEmpty(val)){
							   val=val.replaceAll("^'(.*?)'$", "$1");
						   }
		            
		                  WebElement formEle=null;
						  String GasSupplierPage = "Gas";
				   		  String ElectricSupplierPage = "Electricity";    
				   				
						   switch(key){				   		
						   
							case "supplier":	   	
						   		 if(isElementPresent(By.xpath(".//button[@class='supplier-info__mode-button active']"))){
							   		 
						   			   String buttonName = driver.findElement(By.xpath(".//button[@class='supplier-info__mode-button active']")).getText();
						   			   
							   			if (GasSupplierPage.equalsIgnoreCase(buttonName)){	
							   				
								   			driver.findElement(By.id("gasSupplier")).click();	
								   			formEle=driver.findElement(By.xpath(".//li[contains(text(),'"+val+"')]"));
								   			formEle.click();
							   			
								   			}else if(ElectricSupplierPage.equalsIgnoreCase(buttonName)) {
								   				
							   					driver.findElement(By.id("elecSupplier")).click();			
									   			formEle=driver.findElement(By.xpath(".//li[contains(text(),'"+val+"')]"));	   		
									   			formEle.click();			   			
									   		}
								   				they_enter_their_details(val);
						   		 		}	
							   			break;

						   		 default:
						   			Assert.fail("The suppler dropdown was not recognised "+key+ "Selected "+val);
						   			break;
						   		
						   		}	
				        	}
			        	}

		 }catch(Exception e) {

				 Assert.fail("An error occured with selecting supplier information");
		 }
	 }
	

	 //supplier-info 
	@And("user validates the supplier {string} fields are displayed")
	public void user_validates_the_supplier_fields_are_displayed(String gasOrElecFieldsDisplayed) throws InterruptedException {
	 
		 try {
			
			 gasOrElecFieldsDisplayed=gasOrElecFieldsDisplayed.toLowerCase().trim();
			 WebElement field = null;
			 
			 switch (gasOrElecFieldsDisplayed) {
				case "dual":
					 field = getWebElementByXpath(".//div[@name='dual-payment-method']");
					 Assert.assertTrue(field.isDisplayed());
					 System.out.println("Validated that the field is present "+gasOrElecFieldsDisplayed);
					 break;
					
				case "electric":
				case "elec":
					 field = getWebElementByXpath(".//div[@name='elec-payment-method']");
					 Assert.assertTrue(field.isDisplayed());
					 System.out.println("Validated that the field is present "+gasOrElecFieldsDisplayed);
					 break;
					
				case "gas":
					 field = getWebElementByXpath(".//div[@name='gas-payment-method']");
					 Assert.assertTrue(field.isDisplayed());
					 System.out.println("Validated that the field is present "+gasOrElecFieldsDisplayed);
					 break;
	
				default:
					break;
				}
		
		} catch (Exception e) {
			
				Assert.fail("Error validating field is present "+gasOrElecFieldsDisplayed);
		}
	}
	 
	 @When("user selects a top six supplier {string} icon")
		public void user_selects_a_top_six_supplier_icon(String supplierName) {
			
		 try {
			 
			 	supplierName=supplierName.toLowerCase().trim();
				
				WebElement linkElement=null;
				
				Thread.sleep(5000);
				
				if(!isNullOrEmpty(supplierName)){
										
					switch(supplierName){
					
						case "british gas":
							if(isElementPresent(By.xpath(".//label[@class='suppliers__supplier active']/img[@alt='British Gas']"))) {
								
								System.out.println("Don't do anything");
								
								}else {
									
									linkElement=getWebElementByXpath(".//label[@class='suppliers__supplier']/img[@alt='British Gas']");
									linkElement.click();
									System.out.println("user has selected dual supplier "+supplierName);
								
								}
								break;
							
						case "npower":
							if(isElementPresent(By.xpath(".//label[@class='suppliers__supplier active']/img[@alt='npower']"))) {
								
								System.out.println("Don't do anything");
								
								}else {
									
									linkElement=getWebElementByXpath(".//label[@class='suppliers__supplier']/img[@alt='npower']");
									linkElement.click();
									System.out.println("user has selected dual supplier "+supplierName);
								
								}
								break;
							
						case "e.on":
							if(isElementPresent(By.xpath(".//label[@class='suppliers__supplier active']/img[@alt='E.ON']"))) {
								
								System.out.println("Don't do anything");
								
								}else {
									
									linkElement=getWebElementByXpath(".//label[@class='suppliers__supplier']/img[@alt='E.ON']");
									linkElement.click();
									System.out.println("user has selected dual supplier "+supplierName);					
								}
								break;
							
						case "scottishpower":
							if(isElementPresent(By.xpath(".//label[@class='suppliers__supplier active']/img[@alt='ScottishPower']"))) {
								
								System.out.println("Don't do anything");
								
								}else {
									
									linkElement=getWebElementByXpath(".//label[@class='suppliers__supplier']/img[@alt='ScottishPower']");
									linkElement.click();
									System.out.println("user has selected dual supplier "+supplierName);
								}
								break;
							
						case "edf energy":
							if(isElementPresent(By.xpath(".//label[@class='suppliers__supplier active']/img[@alt='EDF Energy']"))) {
								
								System.out.println("Don't do anything");
								
								}else {
									
									linkElement=getWebElementByXpath(".//label[@class='suppliers__supplier']/img[@alt='EDF Energy']");
									linkElement.click();
									System.out.println("user has selected dual supplier "+supplierName);
								}
								break;
						
						case "sse":
							if(isElementPresent(By.xpath(".//label[@class='suppliers__supplier active']/img[@alt='SSE']"))) {
								
								System.out.println("Don't do anything");
								
								}else {
									
									linkElement=getWebElementByXpath(".//label[@class='suppliers__supplier']/img[@alt='SSE']");
									linkElement.click();
									System.out.println("user has selected dual supplier "+supplierName);
								
								}
								break;
							
							default:
							Assert.fail("The top six supplier was not recognised, energy type is "+ supplierName);
							break;
						}
			 	}else {
					
				 Assert.fail("The top six supplier was not recognised energy type is "+ supplierName);
				}
			
		 }catch(Exception e){
			 
			 Assert.fail("An error occured with selecting a top six supplier energy type is "+ supplierName);		 
		 }	
	 }
	 
	 //todo
	@Then("the top six supplier appears selected {string}")
	public void the_top_six_supplier_appears_selected(String topSixIcon) throws InterruptedException {
	    
		Thread.sleep(2000);
		
		try {
			
			if(!isNullOrEmpty(topSixIcon)){
				topSixIcon=topSixIcon.toLowerCase().trim();
				
				switch (topSixIcon) {
				case "british gas":
					Assert.assertTrue(isElementPresent(By.xpath(".//img[@alt='British Gas']/ancestor::label[@class='suppliers__supplier active']")));
					System.out.println(" Top 6 supplier button is enabled  "+ topSixIcon);
					break;
					
				case "npower":
					Assert.assertTrue(isElementPresent(By.xpath(".//img[@alt='npower']/ancestor::label[@class='suppliers__supplier active']")));
					System.out.println(" Top 6 supplier button is enabled  "+ topSixIcon);
					break;
							
				case "e.on":
					Assert.assertTrue(isElementPresent(By.xpath(".//img[@alt='E.ON']/ancestor::label[@class='suppliers__supplier active']")));
					System.out.println(" Top 6 supplier button is enabled  "+ topSixIcon);
					break;
					
				case "scottishpower":
					Assert.assertTrue(isElementPresent(By.xpath(".//img[@alt='ScottishPower']/ancestor::label[@class='suppliers__supplier active']")));
					System.out.println(" Top 6 supplier button is enabled  "+ topSixIcon);
					break;
					
				case "edf energy":
					Assert.assertTrue(isElementPresent(By.xpath(".//img[@alt='EDF Energy']/ancestor::label[@class='suppliers__supplier active']")));
					System.out.println(" Top 6 supplier button is enabled  "+ topSixIcon);
					break;
					
				case "sse":
					Assert.assertTrue(isElementPresent(By.xpath(".//img[@alt='SSE']/ancestor::label[@class='suppliers__supplier active']")));
					System.out.println(" Top 6 supplier button is enabled  "+ topSixIcon);
					break;
		
				default:
					Assert.fail("Top six supplier was not recognised "+topSixIcon);
					break;
				}		
			}else {
				
				Assert.fail("The top six supplier is null "+topSixIcon);
			}
			
		}catch(Exception e) {
			
			Assert.fail("An error occured with validating the top six supplier selected "+topSixIcon);
			
		}
	 }
	 
	 @Then("^user sees the header$")
	 public void user_sees_the_header() throws Throwable {
	    
		WebElement topNav= getWebElementByXpath(".//*//div[@class='funnel__nav-wrap-inner']");
		
		if(topNav==null){
			Assert.fail("Header not present");
		}
	 }
		
	 	@And("user should see the following fields")
	 	@Given("user should see the footer with the following items")
	 	@Then("user should see the header with the following items")
		 public void user_should_see_the_header_with_the_following_items(DataTable dataTable) throws Throwable {
			
	 		try {
	 			
		 		List<String> headerItems = dataTable.asList(String.class);
		 		
				String stringToCheck = null;
//				WebElement elementToCheck = null;

//				if(dataTable.size() > 0){   
					    
					for (String item : headerItems) {
						
						
						if(!isNullOrEmpty(item)){
							
							item=item.toLowerCase();
													
//							boolean isLinkItem;
//							if(item.contains(" logo")){
//								isLinkItem=true;
//								item=item.replace(" logo", "");
//							}else if(item.contains(" icon")){
//								isLinkItem=true;
//								item=item.replace(" icon", "");				
//							}
							
							item=item.trim();
							item=item.replaceAll("^'(.*?)'$", "$1");
							System.out.println("item to check "+item);
							Thread.sleep(2000);
							switch(item){
							
								case "home":
//									elementToCheck = getWebElementByXpath(".//a/img[@class='funnel-nav__logo']");
									break;
									
								case "energy":
									stringToCheck = getWebElementByXpath("(.//a[@href='/signup/energy-type']").getText().toLowerCase();
									Assert.assertEquals("energy", stringToCheck);
									System.out.println(" Should be energy but is "+stringToCheck);
									break;
									
								case "supplier":
									stringToCheck = getWebElementByXpath("(.//a[@href='/signup/supplier-info']").getText().toLowerCase();
									Assert.assertEquals("supplier", stringToCheck);
									System.out.println(" Should be supplier but is "+stringToCheck);
									break;
									
								case "usage":
									stringToCheck = getWebElementByXpath(".//a[@href='/signup/usage']").getText().toLowerCase();	
									Assert.assertEquals("usage", stringToCheck);
									System.out.println(" Should be usage but is "+stringToCheck);
									break;
									
								case "switch":
									stringToCheck = getWebElementByXpath(".//a[@href='/signup/results']").getText().toLowerCase();	
									Assert.assertEquals("switch", stringToCheck);
									System.out.println(" Should be usage but is "+stringToCheck);
									break;
																
								case "our mission":
									stringToCheck = getWebElementByXpath(".//button[@class='navigation__item--dropdown' and text()='Our mission']").getText().toLowerCase();
									Assert.assertEquals("our mission", stringToCheck);
									System.out.println(" Should be Our mission but is "+stringToCheck);
									break;			
															
								case "help":
									stringToCheck = getWebElementByXpath(".//button[@class='navigation__item--dropdown' and text()='Help']").getText().toLowerCase();
									Assert.assertEquals("help", stringToCheck);
									System.out.println(" Should be help but is "+stringToCheck);
									break;			
								
								case "blog":
									stringToCheck = getWebElementByXpath(".//a[@class='navigation__item' and text()='Blog']").getText().toLowerCase();
									Assert.assertEquals("blog", stringToCheck);
									System.out.println(" Should be blog but is "+stringToCheck);
									break;			
									
								case "finish your sign up":
									stringToCheck = getWebElementByXpath(".//a[@class='button--tertiary-v3' and text()='Finish your sign up']").getText().toLowerCase();
									Assert.assertEquals("finish your sign up", stringToCheck);
									System.out.println(" Should be finish sign up but is "+stringToCheck);
									break;			
									
								case "log in":
									stringToCheck = getWebElementByXpath(".//a[@class='navigation__item--green' and text()='Log in']").getText().toLowerCase();
									Assert.assertEquals("log in",stringToCheck);
									System.out.println(" Should be log in but is "+stringToCheck);
									break;			
								
								case "logout":
									stringToCheck = getWebElementByXpath(".//button[@class='button navigation__item--green' and text()='Logout']").getText().toLowerCase();
									Assert.assertEquals("logout",stringToCheck);
									System.out.println(" Should be log out but is "+stringToCheck);
									break;			
									
								//footer links
								case "about us footer":
									stringToCheck = getWebElementByXpath(".//li[@class='footer__link']//a[@href='/about']").getText().toLowerCase();
									Assert.assertEquals("about us", stringToCheck);
									System.out.println(" Should be about us but is "+stringToCheck);
									break;					
									
								case "fuel poverty footer":	
									stringToCheck = getWebElementByXpath(".//li[@class='footer__link']//a[@href='/fuel-poverty']").getText().toLowerCase();
									Assert.assertEquals("fuel poverty", stringToCheck);
									System.out.println(" Should be fuel poverty but is "+stringToCheck);
									break;	
									
								case "faqs footer":
									stringToCheck = getWebElementByXpath(".//li[@class='footer__link']//a[@href='/faqs']").getText().toLowerCase();
									Assert.assertEquals("faqs", stringToCheck);
									System.out.println(" Should be faqs but is "+stringToCheck);
									break;	
									
								case "contact us footer":
									stringToCheck = getWebElementByXpath(".//li[@class='footer__link']//a[@href='/contact-us']").getText().toLowerCase();
									Assert.assertEquals("contact us", stringToCheck);
									System.out.println(" Should be contact us but is "+stringToCheck);
									break;	
									
								case "t&cs footer":
									stringToCheck = getWebElementByXpath(".//li[@class='footer__link']//a[@href='/terms-and-conditions']").getText().toLowerCase();
									Assert.assertEquals("terms and conditions", stringToCheck);
									System.out.println(" Should be terms and conditions but is "+stringToCheck);
									break;	
									
								case "privacy policy footer":
									stringToCheck = getWebElementByXpath(".//li[@class='footer__link']//a[@href='/privacy-policy']").getText().toLowerCase();
									Assert.assertEquals("privacy policy", stringToCheck);
									System.out.println(" Should be privacy policy but is "+stringToCheck);
									break;	
									
								case "psr":
									stringToCheck = getWebElementByXpath(".//ol[@class='register__extra-questions']//following-sibling::div/label[@for='If anyone in your households has a medical condition, is registered as disabled, or is of pensionable age, your new supplier may be able to offer you additional support where needed. The information is kept confidential and never used for marketing. Are there any special circumstances in your household that you would like your new supplier to be made aware of?']").getText();
									Assert.assertEquals("IF ANYONE IN YOUR HOUSEHOLDS HAS A MEDICAL CONDITION, IS REGISTERED AS DISABLED, OR IS OF PENSIONABLE AGE, YOUR NEW SUPPLIER MAY BE ABLE TO OFFER YOU ADDITIONAL SUPPORT WHERE NEEDED. THE INFORMATION IS KEPT CONFIDENTIAL AND NEVER USED FOR MARKETING. ARE THERE ANY SPECIAL CIRCUMSTANCES IN YOUR HOUSEHOLD THAT YOU WOULD LIKE YOUR NEW SUPPLIER TO BE MADE AWARE OF?*", stringToCheck);
									System.out.println(" Should be PSR and is "+stringToCheck);
									break;	
									
								case "paper billing comms":
									stringToCheck = getWebElementByXpath(".//ol[@class='register__extra-questions']//div/following::label[@for='How would you like migrate to communicate with you for future energy switches']").getText();
									Assert.assertEquals("HOW WOULD YOU LIKE MIGRATE TO COMMUNICATE WITH YOU FOR FUTURE ENERGY SWITCHES*", stringToCheck);
									System.out.println(" Should be Paper billing and is "+stringToCheck);									
									break;	
									
								case "third party t&cs":
									stringToCheck = getWebElementByXpath(".//label[@for='thirdPartyConsent']").getText();
									Assert.assertEquals("I confirm that the individual for whom this account is being created has provided consent for a third party to manage their account.", stringToCheck);
									System.out.println(" Should be Third party t&cs and is "+stringToCheck);
									break;	
									
								default:
									Assert.fail(item+" has not been recognised.");
									break;
							}
						}
					}
		 		
	 		}catch(Exception e) {
	 			
	 				Assert.fail("An error occured - could not validate the fields.");
		 	}
	 	}

	 private boolean isNullOrEmpty(String s) {
		 return s == null || s.length() == 0;
	}
	 
	 @When("user enters their {string} usage numbers {string}")
	 public void user_enters_their_usage_numbers(String usageField, String UsageNumber) {
	    
	 try {
		 
		 int usageNum = ((int)(Math.random() * 4000)) + 500;
		 
		 if(!isNullOrEmpty(usageField)){
				
			 String url = driver.getCurrentUrl();
			 usageField=usageField.toLowerCase().trim();
			 WebElement formElem = null;

			 	Thread.sleep(2000);
				switch(usageField){
				
					case "gas kwh":
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@name='Gas usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(UsageNumber);		
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Gas kWh']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(String.valueOf(usageNum));	
						}else {
							Assert.fail("Could not find the Gas Usage field");
						}
							System.out.println("User has entered usage number "+usageNum);
						break;
				
					case "electric kwh":		
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@name='Electric usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(UsageNumber);
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec kWh']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(String.valueOf(usageNum));
						}else {
							Assert.fail("Could not find the Electric Usage field");
						}
						break;
					
					case "electric spend":		
						if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec Spend']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(String.valueOf(usageNum));
						}else {
							Assert.fail("Could not find the Electric spend field");
						}
						break;
					
					case "gas spend":		
						if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Gas Spend']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(String.valueOf(usageNum));
						}else {
							Assert.fail("Could not find the Gas spend field");
						}
						break;
									
					case "day electric kwh":
					case "electric day kwh":	
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@id='ElectricUsageDay']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(UsageNumber);
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec Day Usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(String.valueOf(usageNum));
						}else {
							Assert.fail("Could not find the Day Electric Usage field");
						}
						break;
				
					case "night electric kwh":
					case "electric night kwh":	
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@id='ElectricUsageNight']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(UsageNumber);
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec Night Usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(String.valueOf(usageNum));
						}else {
							Assert.fail("Could not find the Night Electric Usage field");
						}
						break;
					
					default:
						System.out.println("field "+usageField+" and value "+usageNum+" not supported in They enter usage numbers() ");
						break;
					} 
						System.out.println("User has entered usage number "+usageNum);
				
				}else{
					Assert.fail("Could not find the Usage field "+usageField+","+usageNum);
				}
		 	
		 }catch(Exception e) {
			 
			 Assert.fail("An error occured with entering values into the Usage field "+usageField);
		 }
	 }

	 @When("user enters their {string} usage numbers manually {string}")
	 public void user_enters_their_usage_numbers_manually(String usageField, String usageNumber) {
	    
	 try {
		 		 
		 if(!isNullOrEmpty(usageField)){
				
			 String url = driver.getCurrentUrl();
			 usageField=usageField.toLowerCase().trim();
			 WebElement formElem = null;

			 	Thread.sleep(2000);
				switch(usageField){
				
					case "gas kwh":
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@name='Gas usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Gas kWh']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else {
							Assert.fail("Could not find the Gas Usage field");
						}
							System.out.println("User has enetered usage number "+usageNumber);
						break;
				
					case "electric kwh":		
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@name='Electric usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec kWh']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else {
							Assert.fail("Could not find the Electric Usage field");
						}
						break;
					
					case "electric spend":		
						if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec Spend']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else {
							Assert.fail("Could not find the Electric spend field");
						}
						break;
					
					case "gas spend":		
						if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Gas Spend']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else {
							Assert.fail("Could not find the Gas spend field");
						}
						break;
									
					case "day electric kwh":
					case "electric day kwh":	
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@id='ElectricUsageDay']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec Day Usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else {
							Assert.fail("Could not find the Day Electric Usage field");
						}
						break;
				
					case "night electric kwh":
					case "electric night kwh":	
						if(url.equalsIgnoreCase(PAGE_URL_DASHBOARD)) {
							formElem=getWebElementByXpath(".//form[@class='dashboard__modal']//input[@id='ElectricUsageNight']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else if(url.equalsIgnoreCase(PAGE_URL_USAGE)) { 
							formElem=getWebElementByXpath(".//input[@name='Elec Night Usage']");
							formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
							formElem.sendKeys(usageNumber);		
						}else {
							Assert.fail("Could not find the Night Electric Usage field");
						}
						break;
					
					default:
						System.out.println("field "+usageField+" and value "+usageNumber+" not supported in They enter usage numbers() ");
						break;
					}
				
				}else{
					Assert.fail("Could not find the Usage field "+usageField+","+usageNumber);
				}
		 	
		 }catch(Exception e) {
			 
			 Assert.fail("An error occured with entering values into the Usage field "+usageField);
		 }
	 }

	 @Given("user selects the {string} frequency to {string}")
	 public void user_selects_the_frequency_to(String energyType, String freq) {
	     
		energyType=energyType.toLowerCase().trim();
		 		 
		switch (energyType) {
			case "electric":
				driver.findElement(By.xpath(".//div[@id='elec-frequency']")).click();
				they_enter_their_details(freq);
				System.out.println("Have selected electric");
				break;
				
			case "electric spend":
				driver.findElement(By.xpath(".//input[@id='elec-spend-mode-on']/following::div[@id='elec-frequency']")).click();
				they_enter_their_details(freq);		
				System.out.println("Have selected electric spend");
				break;
				
			case "gas":	
				driver.findElement(By.xpath(".//div[@id='gas-frequency']")).click();
				they_enter_their_details(freq);	
				System.out.println("Have selected gas");
				break;
		
			case "gas spend":
				driver.findElement(By.xpath(".//input[@id='gas-spend-mode-on']/following::div[@id='gas-frequency']")).click();
				they_enter_their_details(freq);	
				System.out.println("Have selected gas spend");
				break;
	
			default:
				Assert.fail("Unable to select the frequency for "+energyType);
				break;
			}
	 	}		 
	
	 //Finish Sign up
	 @Given("user is on the funnel {string} page")
	 public void user_is_on_the_funnel_page(String string) throws InterruptedException {
	    
		user_selects_top_nav_icon(string);
	 }


	 //Finish sign up
	@Then("user sees the {string} button")
	 public void user_sees_the_button(String expectedButtonName) throws InterruptedException {
	    
		Thread.sleep(1000);
		
		try {
			
			expectedButtonName.toLowerCase().trim();
			
			WebElement getButtonName = driver.findElement(By.xpath(".//a[@class='button--tertiary-v3' and text()='Finish your sign up']"));
			String actualButtonname = getButtonName.getText();
			
			System.out.println("The actual button name is "+actualButtonname);
			
			if (expectedButtonName.equalsIgnoreCase("finish your sign up")) {
				
				System.out.println("Checking "+expectedButtonName+" button is displayed");
				Assert.assertTrue("Button is displayed", getButtonName.isDisplayed());
				
			}else {
				
				Assert.fail("Could not find the button name "+expectedButtonName);
			}
			
		}catch(Exception e) {
			
			Assert.fail("An error occured with finding the button name "+expectedButtonName);
		}		 
	 }

	 //Start Again
	 
	 @Then("user is navigated to the returning users sign up page")
	 public void user_is_navigated_to_the_returning_users_sign_up_page() throws InterruptedException {
	
		 Thread.sleep(3000);
		 String expectedUrl = PAGE_URL_SIGNUP;
		 String actualUrl = driver.getCurrentUrl(); 
		 
		 Assert.assertTrue("User is navigated to the returning users sign up page", expectedUrl.equalsIgnoreCase(actualUrl));
		 System.out.println("Asserting true the returning users sign up page ");
		
		 }
 
	@Given("user validates the {string} page title")
	public static void user_validates_the_page_title(String expected) throws InterruptedException {
	
		Thread.sleep(2000);
		
		String actualTitle = driver.getTitle();
		
		Assert.assertEquals(expected, actualTitle);
		System.out.println("Page title is "+actualTitle);
	}
	

	@Then("user validates the {string} URL")
	public static void user_validates_the_URL(String expectedURL) throws InterruptedException {
		
		Thread.sleep(2000);
		
		try {
		
			expectedURL = expectedURL.toLowerCase().trim();
			
			switch (expectedURL) {
			
			case "facebook":
				Assert.assertEquals("https://www.facebook.com/Migrate.co.uk/", driver.getCurrentUrl());
				break;
	
			case "twitter":
				Assert.assertEquals("https://twitter.com/migrateenergy?lang=en", driver.getCurrentUrl());
				break;
			
			case "linkedin":
				Assert.assertEquals("https://www.linkedin.com/authwall?trk=gf&trkInfo=AQEeYiUqxgAqHwAAAW_Xz5BwpvX3mf4OsHMjSJlYBzXAxpVR2w-Pe6LvuLFkZ8rf3fPNC-NXlh0MEKczF5wwUIRHjSr_xwaGkW6A7cGpJQXglnuJh5CtqRaVrnHd-enfKxGGpHw=&originalReferer=https://rewriteuat.migrate.co.uk/fuel-poverty&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Fmigrate-energy%2F", driver.getCurrentUrl());
				break;
			
			case "facebook icon":
				Assert.assertEquals("https://www.facebook.com/login.php?skip_api_login=1&api_key=392195278179694&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Ffeed%3Fapp_id%3D392195278179694%26display%3Dpopup%26caption%3DI%2Bjust%2Bsaved%2Bon%2Bmy%2Benergy%2Bbills%2Bwith%2BMigrate%2Bautomatic%2Bswitching%2521%2BUse%2Bmy%2Breferral%2Bcode%2Band%2Bget%2B%25C2%25A320%2Bwhen%2Byou%2Bsign-up%2521%26link%3Dhttps%253A%252F%252Fmigrate.co.uk%252Fsignup%253Fref%253Dgurdeep%252Bdec54a571ae4d%26source%3Dhttps%253A%252F%252Fmigrate.co.uk%252Fwp-content%252Fuploads%252F2018%252F11%252FMigrate_forMarketing_laptop1.jpg&cancel_url=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Freturn%2Fclose%3Ferror_code%3D4201%26error_message%3DUser%2Bcanceled%2Bthe%2BDialog%2Bflow%23_%3D_&display=popup&locale=en_GB", driver.getCurrentUrl());
				break;
	
			case "twitter icon":
				Assert.assertEquals("https://twitter.com/intent/tweet?text=I%20just%20saved%20on%20my%20energy%20bills%20with%20Migrate%20automatic%20switching!%20Use%20my%20referral%20code%20and%20get%20%C2%A320%20when%20you%20sign-up!%20https://migrate.co.uk/signup?ref=gurdeep%252Bdec54a571ae4d", driver.getCurrentUrl());
				break;
			
			case "whats app icon":
				Assert.assertEquals("https://api.whatsapp.com/send?phone=&text=I%20just%20saved%20on%20my%20energy%20bills%20with%20Migrate%20automatic%20switching%21%20Use%20my%20referral%20code%20and%20get%20%c2%a320%20when%20you%20sign-up%21%20https%3a%2f%2fmigrate.co.uk%2fsignup%3fref%3dgurdeep%252Bdec54a571ae4d&source=&data=", driver.getCurrentUrl());
				break;
			
			case "dashboard":
				Thread.sleep(3000);
				Assert.assertEquals(PAGE_URL_DASHBOARD, driver.getCurrentUrl());
				break;
				
			default:
				Assert.assertEquals(PAGE_URL_HOME_UAT +expectedURL, driver.getCurrentUrl());
				break;
			}		
				System.out.println("User validates the URL "+expectedURL);
			
		}catch(Exception e) {
			
			Assert.fail("An error ocuured with validating the URL "+expectedURL);
		}
	}
 
	//todo capital letters coming through
	@Then("user validates the page text {string}")
	public void user_validates_the_page_text(String expectedText) throws InterruptedException {
	    
		Thread.sleep(3000);
	
		try {
			
		String actualText=getWebElementByXpath(".//*[contains(text(),'" +expectedText+ "')]").getText();
		System.out.println(actualText);			
		
		 if(expectedText.equalsIgnoreCase(actualText)) {
			
				Assert.assertEquals(expectedText, actualText);
				System.out.println("The actual page text is "+ actualText +" expected text is "+expectedText);
				
			}else if(expectedText.equalsIgnoreCase("Warm Home Discount")){
				
				Assert.assertEquals(expectedText, "Warm Home Discount");
				System.out.println("Validated the WHD text");
				
				
			}else {
		
				Assert.fail("The actual page text does not match expected page text " + expectedText);
			}

		}catch(Exception e) {
  			
  			Assert.fail("Error - error validating page text " + expectedText);
  			
	 	}
	}
 
	@Given("user validates the page heading two {string}")
	public void user_validates_the_page_heading_two(String expectedHeaderTwo) throws InterruptedException {
	    
		Thread.sleep(2000);
		
		try {
			
			String actualHeaderTwo=getWebElementByXpath(".//h2").getText();		
			
			Assert.assertEquals(expectedHeaderTwo, actualHeaderTwo);
			System.out.println("Actual header two is "+actualHeaderTwo + " Expected is "+expectedHeaderTwo);		
				
		}catch(Exception e) {
			
			Assert.fail("An error occured with header two "+expectedHeaderTwo);
		}
	}

	@Given("user has entered their usage numbers {string},{string},{string},{string}")
	public void user_has_entered_their_usage_numbers(String elecUsageField, String elecUsageNumber, String gasUsageField, String gasUsageNumber) throws InterruptedException {
	   
		user_enters_their_usage_numbers(elecUsageField, elecUsageNumber);
	    user_enters_their_usage_numbers(gasUsageField, gasUsageNumber);
	    user_selects_the_button("usage");
	}
	    
	@Given("user has entered their electric usage number {string}")
	public void user_has_entered_their_electric_usage_numbers(String elecUsageNumber) throws InterruptedException {
	   
		Thread.sleep(2000);
		user_enters_their_usage_numbers("Electric kwh", elecUsageNumber);
	    user_selects_the_button("usage");
	}
	
	@Given("user has entered their spend numbers {string},{string},{string},{string}")
	public void user_has_entered_their_spend_numbers(String elecSpendField, String elecSpendNumber, String gasSpendField, String gasSpendNumber) throws InterruptedException {
	   
		user_selects_the_radio_button("I Spend Elec");
		user_selects_the_radio_button("I Spend Gas");
		user_enters_their_usage_numbers(elecSpendField, elecSpendNumber);
	    user_enters_their_usage_numbers(gasSpendField, gasSpendNumber);
	    user_selects_the_button("usage");
	}

	@Then("when user creates an account")
	public void when_user_creates_an_account() throws InterruptedException {
	   
		Thread.sleep(2000);
		
		user_validates_the_URL("signup/create-account");
		user_enters_a_new_user_email("gurdeep@migrate.co.uk");
		user_enters_their_password("TestUser1");
		user_enters_their_confirm_password("TestUser1");
		user_selects_the_button("Let's go");
	
	}

    @When("user selects their estimated usage information")
    public void user_selects_their_estimated_usage_information(DataTable data) throws InterruptedException {
    	
    	Thread.sleep(1000);
    	
    	try {
		
    		List<Map<String, String>> content = data.asMaps(String.class, String.class);
		    for (Map<String, String> row : content) {
		        for (Entry<String, String> entry : row.entrySet()) {
		        	
		            String key = entry.getKey();
		            String value = entry.getValue();
			   		
		            if(!isNullOrEmpty(key)) {
		            	
					   switch(key){
					   
					   		case "In my house lives":
					   			driver.findElement(By.id("occupants")).click();	
					   			they_enter_their_details(value);
					   			Thread.sleep(2000);
					   			break;
					   			
					   		case "My energy usage is":
			   					driver.findElement(By.id("energy-usage")).click();	
			   					they_enter_their_details(value);
					   			Thread.sleep(2000);
					   			break;
					   			
					   		case "My insulation is":
					   			driver.findElement(By.id("insulation")).click();	
					   			they_enter_their_details(value);
					   			Thread.sleep(2000);
					   			break;
					   			
					   		case "My heating source is":
						   		driver.findElement(By.id("heating-source")).click();	
						   		they_enter_their_details(value);
					   			Thread.sleep(2000);
						   		break;
							   	 
						   		default:
					   			Assert.fail("Could not select the form element on the estimator "+key+" and value "+value);
					   			break;
					   		}	
					   			System.out.println("Selecting form element in estimator "+key+" and value "+value);
			        	
		            }else {
			        		Assert.fail("Estimator field is not present "+entry.getValue());
			        	}
		        	}
		        }
    	
    	}catch(Exception e) {
    		
    		Assert.fail("An error occured with selecting values in estimator "+data);
    	}
    }
         
   	 @Given("user enters their details to register")
     public void user_enters_their_details_to_register(Map<String, String> formItems) throws InterruptedException {
  	 
  		 try {
  			 
		   for(Map.Entry<String, String> entry : formItems.entrySet()){
			   
			   String key=entry.getKey();
			   String value=entry.getValue();
			   
			   if(!isNullOrEmpty(key)){
				   key=key.replaceAll("^'(.*?)'$", "$1");
				   key=key.toLowerCase().trim();
			   }
			   
			   if(!isNullOrEmpty(value)){
				   value=value.replaceAll("^'(.*?)'$", "$1");
			   }
			   
			   WebElement formElem=null;
	   		   
	   		 switch(key){
		   			
		   		case "firstname":
		   			formElem=driver.findElement(By.id("firstname"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
   					formElem.sendKeys(value);	
   					System.out.println("Entered firstname "+value);
		   			break;
		   			
		   		case "lastname":
		   			formElem=driver.findElement(By.id("lastname"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
		   			formElem.sendKeys(value);	   
		   			System.out.println("Entered lastname "+value);
		   			break;
		   		
		   		case "phone number":
		   			formElem=driver.findElement(By.id("telephone"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
		   			formElem.sendKeys(value);	   		
		   			System.out.println("Entered phone number "+value);
		   			break;
		   			
		   		case "house no":
		   			formElem=driver.findElement(By.id("house-name"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
		   			formElem.sendKeys(value);
		   			System.out.println("Entered house no "+value);
		   			break;
		   			
		   		case "first line of address":
		   			formElem=driver.findElement(By.id("supplyAddressLine1"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
   					formElem.sendKeys(value);
   					System.out.println("Entered first line of address "+value);
		   			break;
		   			
		   		case "electric meter number":
		   			formElem=driver.findElement(By.id("electricMeterNumber"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
		   			formElem.sendKeys(value);			
		   			System.out.println("Entered elec meter no "+value);
		   			break;
		   			
		   		case "gas meter number":
		   			formElem=driver.findElement(By.id("gasMeterNumber"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered gas meter no "+value);
			   		break;
			   		
		   		case "account name":
		   			formElem=driver.findElement(By.id("accountName"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
   					formElem.sendKeys(value);
   					System.out.println("Entered account name "+value);
		   			break;
		   			
		   		case "account number":
		   			formElem=driver.findElement(By.id("accountNumber"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
		   			formElem.sendKeys(value);		
		   			System.out.println("Entered account number "+value);
		   			break;
		   			
		   		case "sort code":
		   			formElem=driver.findElement(By.id("sortCode"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered sortcode "+value);
			   		break;
				
		   		case "time at current address":		
					formElem=getWebElementByXpath(".//input[@id='timeAtSupplyAddress']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered time at current address "+value);
			   		Thread.sleep(2000);
			   		break;
			   		
		   		case "previous address postcode":		
					formElem=getWebElementByXpath(".//input[@name='Second address postcode']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered previous postcode "+value);
			   		Thread.sleep(2000);
			   		break;
					
				case "previous house no":		
					formElem=getWebElementByXpath(".//input[@id='second-house-name']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered previous house no "+value);
			   		break;
					
				case "second address line1":		
					formElem=getWebElementByXpath(".//input[@id='secondAddressLine1']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered second address line 1 "+value);
			   		break;
					
				case "time at previous address":		
					formElem=getWebElementByXpath(".//input[@id='timeAtPreviousAddress']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered time at previous address "+value);
			   		Thread.sleep(1000);
			   		break;
				
				case "second previous address postcode":		
					formElem=getWebElementByXpath(".//input[@name='Second previous address postcode']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered second previous address postcode "+value);
			   		Thread.sleep(2000);
			   		break;
					
				case "third house no":		
					formElem=getWebElementByXpath(".//input[@id='third-house-name']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered third house no "+value);
			   		break;
					
				case "third address line1":		
					formElem=getWebElementByXpath(".//input[@id='thirdAddressLine1']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered third address line1 "+value);
			   		break;
			   		
				case "billing address postcode":		
					formElem=getWebElementByXpath(".//input[@id='billingAddressPostcode']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered billing address postcode "+value);
			   		Thread.sleep(2000);
			   		break;
			   		
				case "billing house no":		
					formElem=getWebElementByXpath(".//input[@id='billing-house-name']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered billing house no "+value);
			   		break;
			   		
				case "billing address line1":		
					formElem=getWebElementByXpath(".//input[@id='billingAddressLine1']");
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
			   		formElem.sendKeys(value);
			   		System.out.println("Entered billing address line 1 "+value);
			   		break;
			   	
				case "gas account number":
					formElem=getWebElementByXpath(".//input[@id='Gas-account-number']");	
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
					System.out.println("Entered gas acc no "+value);
					Thread.sleep(1000);
					break;
					
				case "elec account number":
					formElem=getWebElementByXpath(".//input[@id='Electricity-account-number']");	
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
					System.out.println("Entered elec acc no "+value);
					Thread.sleep(1000);
					break;
				
				//todo
				case "mothers maiden name":
					formElem=getWebElementByXpath(".//input[@id='Mother's-maiden-name']");	
					formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
					System.out.println("Entered mothers maiden name "+value);
					Thread.sleep(1000);
					break;					
					
				case "select second address":
					driver.findElement(By.name("Second address")).click();	
		   			they_enter_their_details(value);
		   			System.out.println("Entered select second address "+value);
					Thread.sleep(2000);
					break;
					
				case "select third address":
					driver.findElement(By.name("Second previous address")).click();	
					they_enter_their_details(value);
		   			System.out.println("Entered second previous address "+value);
					Thread.sleep(2000);
					break;
					
				case "select billing address":
					driver.findElement(By.name("Billing address")).click();	
					they_enter_their_details(value);
		   			System.out.println("Entered billing address "+value);
					Thread.sleep(2000);
					break;
					
		   		case "title":
					driver.findElement(By.xpath(".//div[@id='register-title']//div[@class='v-select select vs--single vs--unsearchable']")).click();	
					they_enter_their_details(value);
		   			System.out.println("Entered title "+value);
					Thread.sleep(2000);
					break;
					
		   		case "select address":
					driver.findElement(By.name("Supply address")).click();			
					they_enter_their_details(value);
					System.out.println("Selected address status "+value);
					Thread.sleep(1000);	
					break;
					
				case "employment status":
					driver.findElement(By.name("Employment status")).click();	
					they_enter_their_details(value);
		   			System.out.println("Selected employment status "+value);
					Thread.sleep(1000);
					break;
					
				case "residential status":
					driver.findElement(By.name("Residential status")).click();	
					they_enter_their_details(value);				        
		   			System.out.println("Selected res status "+value);
					Thread.sleep(1000);
					break;
					
				case "psr":
					driver.findElement(By.xpath(".//ol[@class='register__extra-questions']//div[@name='If anyone in your households has a medical condition, is registered as disabled, or is of pensionable age, your new supplier may be able to offer you additional support where needed. The information is kept confidential and never used for marketing. Are there any special circumstances in your household that you would like your new supplier to be made aware of?']")).click();	
		   			they_enter_their_details(value);			
		   			System.out.println("Selected psr "+value);
					Thread.sleep(2000);
					break;
					
				case "paper billing comms":
					driver.findElement(By.name("How would you like migrate to communicate with you for future energy switches")).click();						
					they_enter_their_details(value);		   			
					System.out.println("Selected paper billing "+value);
					Thread.sleep(2000);
					break;
					
		   		default:
//		   			Assert.fail("Form field not recognised "+key);
		   			break;

	   		 	}	
		   	}		
	 	
  		 }catch(Exception e) {
  			
  			Assert.fail("Exception - Couldn't find form field to enter "+formItems);
	 	
  		 }
  	}
    	
   	 
   	public void they_enter_their_details(String detail) {
   		
   		List <WebElement> myElements =  driver.findElements(By.xpath(".//ul[@role='listbox']/*"));
		 
        for(WebElement e : myElements) {
            if(e.getText().equals(detail)) {
                e.click();
                return;
            }	
        }
        
   	}
   	
   	
  	@Given("they enter a dob {string}") 
  	public void they_enter_a_dob(String dob) throws InterruptedException {
  	 
  		String val = dob; 
  	    WebElement element = driver.findElement(By.id("dateofbirth"));
  	    element.sendKeys(Keys.chord(Keys.CONTROL, "a"));

  	    for (int i = 0; i < val.length(); i++){
  	        char c = val.charAt(i);
  	        String s = new StringBuilder().append(c).toString();
  	        element.sendKeys(s);
  	    }       
  	}
  		  	  
  	public void they_select_a_value(String formField ) {

  		List<WebElement> elements = driver.findElements(By.xpath(".//ul[@role='listbox']/*"));
		System.out.println("Number of elements:" +elements.size());
	
			for (int i=0; i<elements.size();i++){
		      System.out.println("Radio button text:" + elements.get(i).getText());
			}
					
				for (int i=0; i<elements.size();i++){
					
			      if(elements.get(i).getText().equalsIgnoreCase(formField)) {
			
			    	elements.get(i).click();
			      	}
				}	
  	}
  	
  	 @And("user selects a threshold amount")
	    public void user_selects_their_details_to_register(Map<String, String> formItems) throws InterruptedException {
		 
		 try {
			 
			   for(Map.Entry<String, String> entry : formItems.entrySet()){
				   
				   String key=entry.getKey();
				   String val=entry.getValue();
				   
				   if(!isNullOrEmpty(key)){
					   key=key.replaceAll("^'(.*?)'$", "$1");
					   key=key.toLowerCase().trim();
				   }
				   
				   if(!isNullOrEmpty(val)){
					   val=val.replaceAll("^'(.*?)'$", "/�");
				   }
				   
		   		   Thread.sleep(2000);

	    				switch(key){
   
	    					case "threshold":
	    						driver.findElement(By.name("Variable Tariff Switch Threshold")).click();	
	    						they_enter_their_details(val);
	    						break;
	    						
	    					default:
	    						Assert.fail("Field not recognised "+key +", "+val);
	    						break;		
	    						
	    				}	System.out.println("Selecting value "+key +", "+val);
	    	   		}	
			   
		 }catch(Exception e) {
			 
			 Assert.fail("An error occured with selecting dropdown");
		 }
	 }

	@Given("user edits their preferences on the dashboard")
	public void user_edits_their_preferences_on_the_dashboard(DataTable data) {
		
		try {
			
		 List<Map<String, String>> content = data.asMaps(String.class, String.class);
		    for (Map<String, String> row : content) {
		        for (Entry<String, String> entry : row.entrySet()) {
		        	
		            String key = entry.getKey();
		            String value = entry.getValue();
			   				
					   switch(key){
					   
					   		case "switch preference":
					   			getWebElementByXpath(".//div[@name='switchpreference']").click();
					   			they_enter_their_details(value);
					   			System.out.println("selected switch preferencea");
					   			break;
				   			
  						   	case "ratings":
  						   		getWebElementByXpath(".//div[@name='Service star rating']").click();
  						   		they_enter_their_details(value);
					   			System.out.println("selected customer rating");
					   			break;
				   			
  						    case "whd":
  						    	getWebElementByXpath(".//div[@name='warmHomeDiscount']").click();
  						    	they_enter_their_details(value);
					   			System.out.println("whd");
					   			break;
					   			
  						  case "pref contact method":
						    	getWebElementByXpath(".//div[@name='migrateContactMethod']").click();
						    	they_enter_their_details(value);
					   			System.out.println("pref contact method");
					   			break;
					   								   			
  						  case "paper billing":
  							if(value.equalsIgnoreCase("yes")) {
  								
  								WebElement paperBilling = getWebElementByXpath(".//span[@class='checkbox__custom-checkbox']");
  								Boolean isChecked = paperBilling.isSelected();	
  								System.out.println("The paper billing checked box should be selected");
  								
  								if(isChecked=true) {
  									System.out.println("checked");
  									Assert.assertEquals("Radio is selected and should be selected", true, isChecked);
  		
  								}else if (isChecked=false){
  									System.out.println("not checked but selecting");
  									paperBilling.click();
  									Assert.assertEquals("Radio is not selected but should not be selected", false, isChecked);
  								}else {
  									
  									System.out.println("fallen in here - checked");
  								}
  								
  							}else if (value.equalsIgnoreCase("no")) {
  								
  								WebElement paperBilling = getWebElementByXpath(".//span[@class='checkbox__custom-checkbox']");
  								Boolean isChecked = paperBilling.isSelected();	
  								System.out.println("The paper billing checked box should not be selected");
  							
  								if(isChecked=true) {
  									System.out.println("is checked");
  									Assert.assertEquals("Radio is selected", true, isChecked);
  									paperBilling.click();
  									
  								//this is fine when it isn't selected	
  								}else if (isChecked=false) {	
  									System.out.println("not checked");
  									Assert.assertEquals("Radio is not selected", false, isChecked);
  									Thread.sleep(2000);  							
  								}else {
  								
  									System.out.println("fallen in here - not checked");
  								}
  				
  							}else {
  								
  								Assert.fail("Option not recognised - could not validate the paper billing radio "+value);
  							}
  							break;
  											   			
  						    default:
		    					Assert.fail("Field not found when editing the preferences "+key);
	    						break;	
	    						
					   }		System.out.println("Selecting the pref "+key);
			        }
		        }
	
		}catch(Exception e) {
			
			Assert.fail("Error occured. Could not edit preferences on dashboard "+data);
		}
	}
	
	 @Given("user edits their personal details on the dashboard")
     public void user_edits_their_personal_details_on_the_dashboard(Map<String, String> formItems) throws InterruptedException {
  	 
		 try {
			 
		   for(Map.Entry<String, String> entry : formItems.entrySet()){
			   
			   String key=entry.getKey();
			   String value=entry.getValue();
			   
			   if(!isNullOrEmpty(key)){
				   key=key.replaceAll("^'(.*?)'$", "$1");
				   key=key.toLowerCase().trim();
			   }
			   
			   if(!isNullOrEmpty(value)){
				   value=value.replaceAll("^'(.*?)'$", "$1");
			   }
			   
			   WebElement formElem=null;
	   		   Thread.sleep(2000);
	   		   
	   		 switch(key){
		   			
		   		case "firstname":
		   			formElem=driver.findElement(By.id("firstname"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
		   			break;
		   			
		   		case "lastname":
		   			formElem=driver.findElement(By.id("lastName"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
		   			break;

		   		case "account number":
		   			formElem=driver.findElement(By.id("accountNumber"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
		   			break;
		   			
		   		case "sort code":
		   			formElem=driver.findElement(By.id("sortCode"));
		   			formElem.sendKeys(Keys.chord(Keys.CONTROL, "a"));
					formElem.sendKeys(value);
			   		break;
				   	 
		   		case "title":
					driver.findElement(By.name("Title")).click();	
					they_enter_their_details(value);
					Thread.sleep(2000);
					break;
					
				case "employment status":
					driver.findElement(By.id("employment-status")).click();	
					they_enter_their_details(value);
					Thread.sleep(3000);
					break;
					
				case "residential status":
					driver.findElement(By.id("residential-status")).click();	
					they_enter_their_details(value);
					Thread.sleep(2000);
					break;
					
		   		default:
		   			Assert.fail("Personal details not recognised "+key +" value "+value);
		   			break;

	   		 	}	
		   	}		Thread.sleep(2000);
		   		
	 	}catch(Exception e) {
	 	
	 		Assert.fail("An error has occured with editing personal details on dashbaord");
		
		}
	}

	@When("user selects {string} in the start again prompt")
	public void user_selects_in_the_start_again_prompt(String prompt) throws InterruptedException {
	   
		Thread.sleep(1000);
		
		try {
				
			Alert alert = driver.switchTo().alert();
			prompt=prompt.toLowerCase().trim();
			
			switch (prompt) {
			case "confirm":
				alert.accept();
				break;
		
			case "cancel":
				alert.dismiss();
				break;
	
			default:
				Assert.fail("The button in the start again prompt could not be selected "+prompt);
				break;
			}
			
		}catch(Exception e) {
			Assert.fail("An error occured. Could not select the Start again prompt "+prompt);
		}
	}

	//start again
	@Given("user has selected {string} in the start again prompt {string},{string},{string}")
	public void user_has_selected_in_the_start_again_prompt(String promptAction, String buttonName, String prompt, String expectedTitle) throws InterruptedException {
	   
		user_selects_the_button(buttonName);
		user_selects_in_the_start_again_prompt(prompt);
		user_validates_the_page_heading(expectedTitle);
	}

	
	
	@Given("user selects the lived for three years field to {string}")
	public void user_selects_the_lived_for_three_years_field_to(String radioToSelect) throws InterruptedException {
	   
		Thread.sleep(5000);
		
		radioToSelect.toLowerCase().trim();
		WebElement threeYears=null;
		
		try {
			
			switch (radioToSelect) {
			case "yes":
				threeYears = getWebElementByXpath(".//input[@id='sameAddressyes']/following-sibling::span[@class='boolean-radio__fake-radio']");	
				threeYears.click();
				break;
			
			case "no":
				threeYears = getWebElementByXpath(".//input[@id='sameAddressno']/following-sibling::span[@class='boolean-radio__fake-radio']");	
				threeYears.click();    	   
				break;
				
			default:
				Assert.fail("The lived for three years is currently not supported");
				break;
			}	
			
		}catch(Exception e) {
				
				Assert.fail("An error occured with selecting the lived here for three years option "+radioToSelect);
		}
	}

	@Given("user selects the supply address same as billing address field to {string}")
	public void user_selects_the_supply_address_same_as_billing_address_field_to(String radioToSelect) {
	  
		radioToSelect.toLowerCase().trim();
		WebElement billingAddress=null;
		
		try {
			
			switch (radioToSelect) {
			case "yes":
				billingAddress = getWebElementByXpath(".//input[@id='uniqueBillingAddressyes']/following-sibling::span[@class='boolean-radio__fake-radio']");	
				billingAddress.click();
				break;
			
			case "no":
				billingAddress = getWebElementByXpath(".//input[@id='uniqueBillingAddressno']/following-sibling::span[@class='boolean-radio__fake-radio']");	
				billingAddress.click();    	   
				break;
				
			default:
				Assert.fail("Did not recognise the option for supply address same as billing address "+radioToSelect);
				break;
			}	
			
		}catch(Exception e) {
				
				Assert.fail("An error occured with selecting the supply address same as billing address "+radioToSelect);

		}
	}

	@Given("user selects the {string} smart meter field to {string}")
	public void user_selects_the_smart_meter_field_to(String energyType, String radioToSelect) {
	 
		try {
			
			energyType=energyType.toLowerCase().trim();
			radioToSelect=radioToSelect.toLowerCase().trim();
			WebElement formElem = null;
	
			switch (energyType) {
			
			case "electric":
				if(radioToSelect.equalsIgnoreCase("yes")) {
					formElem = getWebElementByXpath(".//input[@id='smartElecMeteryes']/following-sibling::span[@class='boolean-radio__fake-radio']");	
					formElem.click();
	    			
				}else if(radioToSelect.equalsIgnoreCase("no")){
					formElem = getWebElementByXpath(".//input[@id='smartElecMeterno']/following-sibling::span[@class='boolean-radio__fake-radio']");	
					formElem.click();
				}else {
					
					Assert.fail("The smart meter field option for Yes could not be selected "+energyType);
				}
				break;
			
			case "gas":
				if(radioToSelect.equalsIgnoreCase("yes")) {
					formElem = getWebElementByXpath(".//input[@id='smartGasMeteryes']/following-sibling::span[@class='boolean-radio__fake-radio']");	
					formElem.click();
	    			
				}else if(radioToSelect.equalsIgnoreCase("no")){
					formElem = getWebElementByXpath(".//input[@id='smartGasMeterno']/following-sibling::span[@class='boolean-radio__fake-radio']");
					formElem.click();
				}  else {
					
					Assert.fail("The smart meter field option could not be selected "+energyType);
				}
				break;
				
			default:
				Assert.fail("The smart meter field is not selected "+energyType);
				break;
			}	
			
		}catch(Exception e) {
				
				Assert.fail("An error occured with selecting the smart meter "+energyType);
		}
	}
		
	//Dashboard
	
	@Then("user validates the tariff name {string}")
	public void user_validates_the_tariff_name(String tariffName) {
	
		webElement1 = getWebElementByXpath(".//img/following-sibling::span[@class='dashboard__tariff-name']");
		String actualTariff = webElement1.getText();
		
		Assert.assertEquals(tariffName, actualTariff);
		System.out.println("The actual tariff name is "+ actualTariff);
		
	}


	@Then("user validates the savings cost {string}")
	public void user_validates_the_savings_cost(String savingsCost) {
	 
		webElement1 = getWebElementByXpath(".//div[@class='dashboard__savings-copy']//following-sibling::span[@class='dashboard__savings-value']");
		String actualSavingsCost = webElement1.getText();
		
		Assert.assertEquals(savingsCost, actualSavingsCost);
		System.out.println("The actual tariff name is "+ actualSavingsCost);
		
	}

	@Given("user validates their preferences on the dashboard")
	@Then("user validates the preferences dialog values")
	public void user_validates_the_preferences_dialog_values(DataTable data) throws InterruptedException {
		
		Thread.sleep(2000);
		
		try {
			
			 List<Map<String, String>> content = data.asMaps(String.class, String.class);
			    for (Map<String, String> row : content) {
			        for (Entry<String, String> entry : row.entrySet()) {
			        	
			            String key = entry.getKey();
			            key=key.toLowerCase().trim();
			            String value = entry.getValue();
			            
			            WebElement formElem=null;
		   		   
		   		 switch(key){
			   			
		   		 case "switch preference":
			   			formElem=driver.findElement(By.name("switchpreference"));
						String title = formElem.getText();
			   			Assert.assertEquals(value, title);
			   			System.out.println("The value is "+value + " And the key is "+title);
						break;
				
					case "ratings":
						formElem=driver.findElement(By.name("Service star rating"));	
						String employStatus = formElem.getText();
			   			Assert.assertEquals(value, employStatus);
			   			System.out.println("The value is "+value + " And the key is "+employStatus);
						break;
						
					case "whd":
						formElem=driver.findElement(By.name("warmHomeDiscount"));
						String resStatus = formElem.getText();
			   			Assert.assertEquals(value, resStatus);
			   			System.out.println("The value is "+value + " And the key is "+resStatus);
						break;
						
					case "paper billing":
						WebElement paperBilling = getWebElementByXpath(".//span[@class='checkbox__custom-checkbox']");
						Boolean isChecked = paperBilling.isSelected();	
						
						if(value.equalsIgnoreCase("yes")) {
														
							if(isChecked) {
								Assert.assertEquals("Radio is selected and should be selected", true, isChecked);
	
							}else if(!isChecked) {
								Assert.assertEquals("Radio is not selected", true, !isChecked);
							}
				
							
						}else if (value.equalsIgnoreCase("no")) {
							
							if(isChecked) {
								Assert.assertEquals("Radio should not selected but is selected", false, isChecked);
							
							}else if(!isChecked) {
								Assert.assertEquals("Radio is not selected and should not be selected", true, !isChecked);
							} 
						}else {
							
							Assert.fail("Option not recognised - could not validate the paper billing radio "+value);
						}
						break;
						
					case "comms pref":	
					case "pref contact method":
						formElem=driver.findElement(By.name("migrateContactMethod"));
						String commsPref = formElem.getText();
			   			Assert.assertEquals(value, commsPref);
			   			System.out.println("The value is "+value + " And the key is "+commsPref);
						break;
						
			   		default:
			   			Assert.fail("Couldn't find the field to validate in preferences "+key);
			   			break;
	
		   		 	}	
			   	}		
		 	
			    }
		    
  		 }catch(Exception e) {
  		
  			Assert.fail("Exception - Couldn't find form field to validate preferences "+data);
	 	
  		 }
  	}	
	

	@Given("user validates their personal details")
	public void user_validates_their_personal_details(Map<String, String> formItems) throws InterruptedException {
	
	Thread.sleep(2000);
	
  		 try {
  			 
		   for(Map.Entry<String, String> entry : formItems.entrySet()){
			   
			   String key=entry.getKey();
			   String value=entry.getValue();
			   
			   if(!isNullOrEmpty(key)){
				   
				   key=key.toLowerCase().trim();
			   }
			   
			   if(!isNullOrEmpty(value)){
				   value=value.replaceAll("^'(.*?)'$", "$1");
			   }
			   
			   WebElement formElem=null;
	   		   
	   		 switch(key){
	
		   		case "title":
		   			formElem=driver.findElement(By.name("Title"));
					String title = formElem.getText();
		   			Assert.assertEquals(value, title);
		   			System.out.println("The value is "+value + " And the key is "+title);
					break;
			
				case "employment status":
					formElem=driver.findElement(By.name("Employment status"));	
					String employStatus = formElem.getText();
		   			Assert.assertEquals(value, employStatus);
		   			System.out.println("The value is "+value + " And the key is "+employStatus);
					break;
					
				case "residential status":
					formElem=driver.findElement(By.name("Residential status"));
					String resStatus = formElem.getText();
		   			Assert.assertEquals(value, resStatus);
		   			System.out.println("The value is "+value + " And the key is "+resStatus);
					break;
					
		   		default:
		   			Assert.fail("Could not find field - need to update feature file");
		   			break;
	   		 	}	
		   	}	
	 	
  		 }catch(Exception e) {
  			
  			Assert.fail("Exception - Couldn't find form field to validate "+formItems);
	 	
  		 }
  	}
  

	@Given("user selects the region {string}")
	public void user_selects_the_region(String regionName) throws InterruptedException {
	   
		Thread.sleep(10000);
			
		try {
			
			webElement1 = getWebElementByXpath(".//div[@id='region-select']");
			webElement1.click();
			they_enter_their_details(regionName);
			Thread.sleep(2000);
			
		}catch(Exception e){
			
			Assert.fail("Error occured - Region field is not visible to select "+regionName);
		
		}	
	}
	


	public boolean isElementPresent(By locatorKey) {
	    try {
	        driver.findElement(locatorKey);
	        return true;
	    } catch (org.openqa.selenium.NoSuchElementException e) {
	        return false;
	    }
	}

	public boolean isElementVisible(String cssLocator){
	    return driver.findElement(By.cssSelector(cssLocator)).isDisplayed();
	}
	
	@And("the {string} button is {string}")
	@Then("the {string} field is {string}")
	public void the_field_appear(String field, String displayed) throws InterruptedException {
	  
		Thread.sleep(5000);
	
		try {
		
			switch (field) {
				
			case "paper billing":
				
				if(displayed.equalsIgnoreCase("displayed")) {
					WebElement regionField = driver.findElement(By.xpath(".//div[@class='form-control dashboard__paper-pref']//label[@class='checkbox__label']"));
					Assert.assertEquals(true, regionField.isDisplayed());
					System.out.println("Paper bill is displayed");
					
					}else if(displayed.equalsIgnoreCase("not displayed")) {
						
						Assert.assertFalse("Paper billing field should not be displayed ",isElementPresent(By.xpath(".//div[@class='form-control dashboard__paper-pref']//label[@class='checkbox__label']")));
						System.out.println("Paper bill is not displayed");
				}				
				break;
				
			case "threshold":
				
				if(displayed.equalsIgnoreCase("displayed")) {
					
					Assert.assertTrue("Threshold field should be displayed ",isElementPresent(By.xpath(".//div[@name='Variable Tariff Switch Threshold']")));
					System.out.println("Threshold is displayed");
					
					}else if(displayed.equalsIgnoreCase("not displayed")) {
	
						Assert.assertFalse("Threshold field should not be displayed ",isElementPresent(By.xpath(".//div[@name='Variable Tariff Switch Threshold']")));
						System.out.println("Threshold is not displayed");
				}				
				break;
				
			case "supplier options":
				
				if(displayed.equalsIgnoreCase("displayed")) {
					
					Assert.assertTrue("supplier options field should be displayed ",isElementPresent(By.xpath(".//ul[@class='switch-preferences__deal-types']")));
					System.out.println("supplier options is displayed");
					
					}else if(displayed.equalsIgnoreCase("not displayed")) {
						
			
						Assert.assertFalse("supplier options field should not be displayed ",isElementPresent(By.xpath(".//ul[@class='switch-preferences__deal-types']")));
						System.out.println("supplier options is not displayed");
				}				
				break;
				
				case "direct debit":
					
					if(displayed.equalsIgnoreCase("displayed")) {
						
						Assert.assertTrue("direct debit form should be displayed ",isElementPresent(By.xpath(".//div[@class='funnel-section__header-text' and text()='Set up your Direct Debit']")));
						System.out.println("direct debit form is displayed");
						
						}else if(displayed.equalsIgnoreCase("not displayed")) {
						
							Assert.assertFalse("direct debit form should not be displayed ",isElementPresent(By.xpath(".//div[@class='funnel-section__header-text' and text()='Set up your Direct Debit']")));
							System.out.println("direct debit form is not displayed");
					}				
					break;
					
				case "save details":
					
					if(displayed.equalsIgnoreCase("displayed")) {
						
						Assert.assertTrue("save details button should be displayed ",isElementPresent(By.xpath(".//div[@class='details__buttons']//button[@class='button--tertiary-v3']")));
						System.out.println("save details button is displayed");
						
						}else if(displayed.equalsIgnoreCase("not displayed")) {
						
							Assert.assertFalse("save details button should not be displayed ",isElementPresent(By.xpath(".//div[@class='details__buttons']//button[@class='.//div[@class='details__buttons']//button[@class='button--tertiary-v3']']")));
							System.out.println("save details button is not displayed");
					}				
					break;
				
			default:
				break;
			}
			
		}catch(Exception e) {
			
			Assert.fail("An error occured with the "+field+" field and state "+displayed);
		}
	}
	

	@Given("user logs in as a registered economy meter and dual user {string},{string},{string}")
	public void user_logs_in_as_a_registered_econ_meter_and_dual_user(String email, String password, String buttonName) throws InterruptedException {
	 
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
	}

	@Given("user logs in as a registered economy meter and electric only user {string},{string},{string}")
	public void user_logs_in_as_a_registered_econ_meter_and_electric_only_user(String email, String password, String buttonName) throws InterruptedException {
	 
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
		
	}

	@Given("user logs in as a registered economy and prepayment meter and dual user {string},{string},{string}")
	public void user_logs_in_as_a_registered_econ_and_prepayment_meter_and_dual_user(String email, String password, String buttonName) throws InterruptedException {
	 
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
	}

	@Given("user logs in as a registered economy and prepayment meter and electric user {string},{string},{string}")
	public void user_logs_in_as_a_registered_econ_and_prepayment_meter_and_electric_user(String email, String password, String buttonName) throws InterruptedException {
	    
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
	}

	@Given("user logs in as a registered prepayment meter and dual user {string},{string},{string}")
	public void user_logs_in_as_a_registered_prepayment_meter_and_dual_user(String email, String password, String buttonName) throws InterruptedException {
	 
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
	}

	@Given("user logs in as a registered prepayment meter and electric user {string},{string},{string}")
	public void user_logs_in_as_a_registered_prepayment_meter_and_electric_user(String email, String password, String buttonName) throws InterruptedException {
	  
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
	}

	@Given("user logs in as a registered dual user {string},{string},{string}")
	public void user_logs_in_as_a_registered_dual_user(String email, String password, String buttonName) throws InterruptedException {
	  
		 driver.navigate().to(PAGE_URL_LOGIN);
		 user_enters_their_email(email);
		 user_enters_their_password(password);
		 user_selects_the_button(buttonName);
		 Thread.sleep(2000);
	}
	
	@When("user selects the more info link for tariff {string}")
	public void user_selects_the_more_info_link_for_tariff(String expectedTariffMoreInfo) throws InterruptedException {
	    
		Thread.sleep(2000);
		
		try {
			
			String actualTariffName = getWebElementByXpath(".//*[contains(text(), '"+expectedTariffMoreInfo+"')]").getText();
  			
  			System.out.println("Actual tariff name selected is "+actualTariffName +" and expected tariff name to be selected was "+expectedTariffMoreInfo);
  			
  			if(expectedTariffMoreInfo.equalsIgnoreCase(actualTariffName)) {
  				webElement2=getWebElementByXpath(".//*[contains(text(), '"+expectedTariffMoreInfo+"')]/following::button[contains(text(),'More info')][1]");
  				webElement2.click();
				
  			}else {
  				
  				Assert.fail("Cannot find the tariff name "+expectedTariffMoreInfo);
  			}
			
		}catch(Exception e) {
			
			Assert.fail("An error occured selecting the more info link for tariff "+expectedTariffMoreInfo);
		}
	}
	
	@When("user selects the more info link for a tariff")
	public void user_selects_the_more_info_link_for_a_tariff() throws InterruptedException {
	    
		Thread.sleep(2000);
		
		try {
		
			int i = 1;
			i++;
			
			List<WebElement> moreInfoLinks =  driver.findElements(By.xpath(".//div[@class='results-list__item']//button"));
			
			if(moreInfoLinks.size()>0) {
				
				moreInfoLinks.get(i).click();
				

  			}else {
  				
  				Assert.fail("Could not select the more info link");
  			}
			
		}catch(Exception e) {
			
			Assert.fail("An error occured selecting the more info link");
		}
	}
	

	@When("user sees the {string} prompt")
	public void user_sees_the_prompt(String prompt) {
	    
		try {
		prompt=prompt.toLowerCase().trim();
		
		switch (prompt) {
		case "delayed":
		case "prepayment":
		case "prepayment meter":
		case "missing payment type":
			WebElement delayedPrompt = getWebElementByXpath(".//div[@class='modal']");
			Assert.assertTrue("The delayed switch prompt is displayed", delayedPrompt.isDisplayed());
			break;
			
		case "TIL":
			WebElement tilPrompt = getWebElementByXpath(".//div[@class='modal results-modal']");
			Assert.assertTrue("The TIL switch prompt is displayed", tilPrompt.isDisplayed());
			break;

		case "gas meter number":
		case "electric meter number":
			WebElement meterNumberPrompt = getWebElementByXpath(".//div[@class='modal__inner']");
			Assert.assertTrue("The "+prompt+" prompt is displayed", meterNumberPrompt.isDisplayed());		
			break;

			
			
		default:
			Assert.fail("Cannot see the prompt "+prompt);
			break;
			
		}	System.out.println("User can see the prompt "+prompt);
		
		}catch(Exception e) {
			
			Assert.fail("An error occured - cannot see the prompt "+prompt);
		}
	}
	
	@Given("user validates the WHD preference is {string}")
	public void user_validates_the_WHD_preference_is(String whdPref) {
	    
		String actualwhdPref = getWebElementByXpath(".//div[@name='warmHomeDiscount']").getText();
		
		Assert.assertEquals("Asserting", whdPref, actualwhdPref);
				
	}
	
	@When("user confirms the radio is selected {string}")
	public void user_confirms_the_radio_is_selected(String radio) throws InterruptedException {
	   
	Thread.sleep(1000);	
  		
  		try {
  			radio=radio.toLowerCase().trim();
  			WebElement radioToCheck = null;
  			
  			switch (radio) {
  			case "none":
  				System.out.println("There isn't a radio button for the following option "+radio);
				break;
				
  			case "whd":
  				radioToCheck = getWebElementByXpath(".//input[@id='warm-home']/following-sibling::span[@class='checkbox__fake-checkbox']");
				Assert.assertTrue("The whd option is not selected", radioToCheck.isEnabled());
				break;
				
			case "ratings":
				radioToCheck = getWebElementByXpath(".//input[@id='csr']/following-sibling::span[@class='checkbox__fake-checkbox']");
				Assert.assertTrue("The ratings option is not selected", radioToCheck.isEnabled());
				break;
				
			case "paper billing":
				radioToCheck = getWebElementByXpath(".//div[@class='checkbox__wrap active']//input[@id='paper-billing']/following-sibling::span[@class='checkbox__fake-checkbox']");
				Assert.assertTrue("The paper billing option is not selected", radioToCheck.isEnabled());
				break;
				
			case "econ meter no":
				radioToCheck = getWebElementByXpath(".//input[@id='econ7no']/following-sibling::span[@class='boolean-radio__fake-radio']");
				Assert.assertTrue("The econ 7 no option is not selected", radioToCheck.isEnabled());
				break;
				
			case "econ meter yes":
				radioToCheck = getWebElementByXpath(".//input[@id='econ7yes']/following-sibling::span[@class='boolean-radio__fake-radio']");
				Assert.assertTrue("The econ 7 yes option is not selected", radioToCheck.isEnabled());
				break;

			default:
				Assert.fail("Radio not recognised and selected for "+radio);
				break;
			}
  			
  			System.out.println("Confirmed the radio was selected for "+radio);
  		
  		}catch(Exception e) {
  			
  			Assert.fail("The option was not selected for "+radio);
  		}
	}
	
	@Given("user validates the metadata field {string}")
	public void user_validates_the_metadata_field(String expectedMetadata) {
	   
  		try {
  			
  			 if(expectedMetadata.equalsIgnoreCase("None")) {
				 
				 System.out.println("No metadata to check");
				 Assert.assertEquals(expectedMetadata, "None");

				 }else {
					 
					 //todo
					 //need a for loop to validate multiple metadata tags
					 	String actualMetadata = getWebElementByXpath(".//ul[@class='results-list__column--properties']//*[contains(text(), '"+expectedMetadata+"')]").getText();
			  			System.out.println("Metadata is "+actualMetadata);
			  			Assert.assertEquals(expectedMetadata, actualMetadata);
  				
				 		}
  			
  		}catch(Exception e) {
  			
  			Assert.fail("An error occured with validating the metadata for "+expectedMetadata);
  		}
	}

	@Then("user switches to the social media window {string},{string}")
	public void user_switches_to_the_social_media_window(String icon, String url) throws InterruptedException {
	  
		Thread.sleep(1000);
		
		System.out.println("User is switching to previous window");
		
		try {
		// Store the current window handle
		String winHandleBefore = driver.getWindowHandle();

		// Perform the click operation that opens new window
		user_selects_the_link(icon);
	  

		// Switch to new window opened
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}

		// Perform the actions on new window
		Thread.sleep(2000);
		  user_validates_the_URL(url);


		// Close the new window, if that window no more required
		driver.close();

		// Switch back to original browser (first window)
		driver.switchTo().window(winHandleBefore);

		// Continue with original browser (first window)
		driver.switchTo().defaultContent();
		
		}catch(Exception e) {
			
			Assert.fail("An error occured switching to the social media window");			
		}
	}

	@Then("user switches to the new window {string}")
	public void user_switches_to_the_new_window(String newWindowURL) throws InterruptedException {
	  
		Thread.sleep(3000);
		
		System.out.println("User is switching to previous window");
		
		try {
		// Store the current window handle
		String winHandleBefore = driver.getWindowHandle();

		// Perform the click operation that opens new window
	 

		// Switch to new window opened
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}

		Thread.sleep(3000);
		
		// Perform the actions on new window
		  user_validates_the_URL(newWindowURL);


		// Close the new window, if that window no more required
		driver.close();

		// Switch back to original browser (first window)
		driver.switchTo().window(winHandleBefore);

		// Continue with original browser (first window)
		driver.switchTo().defaultContent();
		
		}catch(Exception e) {
			
			Assert.fail("An error occured switching to the new window");			
		}
	}

	
	//Suppliers t&c
	@Then("user switches to the previous window")
	public void user_switches_to_the_previous_window() throws InterruptedException {
	  
		Thread.sleep(3000);
		
		System.out.println("User is switching to previous window");
		
		
		// Store the current window handle
		String winHandleBefore = driver.getWindowHandle();

		// Perform the click operation that opens new window
//		user_selects_the_button("facebook footer");
	  

		// Switch to new window opened
		for(String winHandle : driver.getWindowHandles()){
		    driver.switchTo().window(winHandle);
		}

		// Perform the actions on new window
//		  user_validates_the_URL("facebook");


		// Close the new window, if that window no more required
		driver.close();

		// Switch back to original browser (first window)
		driver.switchTo().window(winHandleBefore);

		// Continue with original browser (first window)
		driver.switchTo().defaultContent();
		
		
	}
	

	//Delayed user dashboard
	@Given("user sees the {string} user dashboard")
	public void user_sees_the_user_dashboard(String typeOfSwitch) {
	    
		try {
			
			typeOfSwitch=typeOfSwitch.toLowerCase().trim();
			
			if(typeOfSwitch.equalsIgnoreCase("delayed")) {
				
				webElement1 = getWebElementByXpath(".//article[@class='dashboard delayed']");
				Assert.assertTrue("Delayed dashboard is visible", webElement1.isDisplayed());
				
			
			}else if (typeOfSwitch.equalsIgnoreCase("switched"))  {
				
				webElement1 = getWebElementByXpath(".//article[@class='dashboard']");
				Assert.assertTrue("Switched dashboard is visible", webElement1.isDisplayed());
			
			}else {
				
				//if anything else other than delayed or switched is entered then it will fall into this
				Assert.fail("The "+typeOfSwitch+" dashboard should be displayed for user type ");
			
			}	System.out.println("User sees the dashboard "+typeOfSwitch);
			
		}catch(Exception e) {
			
			Assert.fail("An error occured - the dashboard for this user is not displayed "+typeOfSwitch);
			
		}	
	}
	

	@Then("user has selected their default energy supplier information")
	public void user_has_selected_their_default_energy_supplier_information() throws InterruptedException {
	   
		user_selects_the_button("Continue");
		
	}
	
	//Has selected the Finish Sign up button
	@Given("user has selected the {string} button {string},{string},{string}")
	public void user_has_selected_the_button(String buttonName, String currentURL, String expectedButtonName, String buttonNameSelected) throws InterruptedException {
		
		user_validates_the_URL(currentURL);
		user_selects_the_button("Home");
		user_sees_the_button(expectedButtonName);
		user_selects_the_button(buttonNameSelected);
		   
	}

	@Given("user scrolls down")
	public void user_scrolls_down() {
				
		System.out.println("Scrolling into view down");
		JavascriptExecutor js = (JavascriptExecutor) driver;
	    js.executeScript("javascript:window.scrollBy(0,2000)");
				
	}	
	
	@Given("user scrolls up")
	public void user_scrolls_up(){
		
		JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("javascript:window.scrollTo(0,0)");
		
	}
	
	@Given("user validates the threshold amount {string}")
	public void user_validates_the_threshold_amount(String expectedThresholdAmount) {
		
		WebElement thresholdField = getWebElementByXpath(".//form[@class='dashboard__variable-tariff']/h3");
		Assert.assertTrue("The Threshold field is displayed", thresholdField.isDisplayed());
		System.out.println("The threshold field is visible");
		
		
		String actualThresholdAmount = getWebElementByXpath(".//form[@class='dashboard__variable-tariff']//span[@class='vs__selected']").getText();
		Assert.assertEquals(expectedThresholdAmount, actualThresholdAmount);
		System.out.println("Actual is "+actualThresholdAmount);
	}

	@Given("user validates the dashboard {string} text {string}")
	public void user_validates_the_dashboard_usage_text(String field, String expectedUsageText) {
	  
		try {
			
			Thread.sleep(2000);
			
			field = field.toLowerCase().trim();
			
			if(field.equalsIgnoreCase("usage")) {
				
				String actualUsageText = getWebElementByXpath(".//span[@class='dashboard__usage-text'][2][1]").getText();
				
				Assert.assertEquals(expectedUsageText, actualUsageText);
				System.out.println("Expected usage text "+expectedUsageText+" actual is "+actualUsageText);
		
			}else if(field.equalsIgnoreCase("raf")) {
				
				String actualUsageText1 = getWebElementByXpath(".//h2[@class='refer__title']/span[1]").getText();
				String actualUsageText2 = getWebElementByXpath(".//h2[@class='refer__title']/span[2]").getText();
				String actualUsageText3 = getWebElementByXpath(".//h2[@class='refer__title']/span[3]").getText();
				String raf = actualUsageText1 +" "+ actualUsageText2 +" "+ actualUsageText3;
				
				Assert.assertEquals(expectedUsageText, raf);
				System.out.println("Expected raf text "+expectedUsageText+" actual is "+raf);
				
			} else {
				
				Assert.fail("The text was not recognised "+expectedUsageText);
			
			} System.out.println("Validating dashboad text "+expectedUsageText);
			
		}catch(Exception e) {
			
			Assert.fail("An error occured the text could not be validated "+expectedUsageText);
			
		}
	}
	

	@Given("user validates their {string} usage number {string}")
	public void user_validates_their_usage_number(String energyType, String usageNumber) {
	  			
		try {
		  				
			energyType=energyType.toLowerCase().trim();
			
			switch (energyType) {
			
				case "electric kwh":
				case "electric":
					String elecUsageNumber = getWebElementByXpath(".//span[contains(text(),'Your electricity usage per year')]/following-sibling::span[@class='dashboard__usage-value']").getText();
					Assert.assertEquals(usageNumber, elecUsageNumber);
					System.out.println("The expected energy and usage is "+energyType +","+usageNumber);
					break;
					
				case "electric day kwh":
				case "electric day":
					String elecDayUsageNumber = getWebElementByXpath(".//span[contains(text(),'day electricity usage per year')]/following-sibling::span[@class='dashboard__usage-value']").getText();
					Assert.assertEquals(usageNumber, elecDayUsageNumber);
					System.out.println("The expected energy and usage is "+energyType +","+usageNumber);
					break;
					
				case "electric night kwh":
				case "electric night":
					String elecNightUsageNumber = getWebElementByXpath(".//span[contains(text(),'night electricity usage per year')]/following-sibling::span[@class='dashboard__usage-value']").getText();
					Assert.assertEquals(usageNumber, elecNightUsageNumber);
					System.out.println("The expected energy and usage is "+energyType +","+usageNumber);
					break;
	
				case "gas kwh":
				case "gas":
					String gasUsageNumber = getWebElementByXpath(".//span[contains(text(),'gas usage per year')]/following-sibling::span[@class='dashboard__usage-value']").getText();
					Assert.assertEquals(usageNumber, gasUsageNumber);
					System.out.println("The expected energy and usage is "+energyType +","+usageNumber);
					break;					
					
				default:
					Assert.fail("Could not find the field to validate "+energyType);
					break;
				}
			
		}catch(Error e) {
			
			Assert.fail("An error occured. Could not validate the usage fields");
			
		}
	}
	

	@Given("user validates the home page heading")
	public void user_validates_the_home_page_heading() {

			String expectedHeader=HOME_PAGE_HEADING;	
			String expectedCouncilHeader = HOME_PAGE_COUNCIL_HEADING;
			String actualHeader=getWebElementByXpath(".//h1").getText();							
			String url = driver.getCurrentUrl();
		
		try {
			
			if(url.equalsIgnoreCase(PAGE_URL_HOME_UAT)) {
				Assert.assertEquals(expectedHeader, actualHeader);
				System.out.println("Expected Home page heading is "+expectedHeader +"Actual heading is "+actualHeader);		
		
			}else if(url.equalsIgnoreCase(PAGE_URL_COUNCIL_HOME_UAT)) {
				
				Assert.assertEquals(expectedCouncilHeader, actualHeader);
				System.out.println("Expected Council page heading is "+expectedCouncilHeader +"Actual heading is "+actualHeader);	
			}
		
		}catch(Exception e) {
			
			Assert.fail("An error occured with header "+expectedHeader);
		}	
	}

		
	//TODO
	@Given("the {string} page has loaded")
	public void the_page_has_loaded(String page) {
	   
		try {
			
			webElement1 = getWebElementByXpath(".//div[@class='calendar-date dashboard__calendar']");
	
			if(webElement1.isDisplayed()) {
				
				Assert.assertTrue("The "+page+" has loaded ",webElement1.isDisplayed());
				
			}else {
					
				Assert.assertTrue("There has been a problem with the "+page+" loading ", getWebElementByXpath(".//span[@class='dashboard__authenticating-text']").isDisplayed());
				
			}
		
		}catch(Exception e) {
			
			Assert.fail("An error occured - There was a problem with the "+page+" loading");
		}
	}
	

	@Then("user confirms the {string} field appears on the {string} page")
	public void user_confirms_the_field_appears_on_the_page(String expectedFieldName, String pageName) {
	    
		try {
			
			pageName=pageName.toLowerCase().trim();
			expectedFieldName=expectedFieldName.toLowerCase().trim();
	
			switch (pageName) {
			
			case "estimator":
				WebElement actualFieldName = getWebElementByXpath(".//div[@name='heating source']");
				Assert.assertTrue(actualFieldName.isDisplayed());
				break;
				
			case "dashboard":
				WebElement paperBilling = getWebElementByXpath(".//span[@class='checkbox__custom-checkbox']");
				Assert.assertTrue(paperBilling.isDisplayed());
				break;
	
			default:
				Assert.fail("Field not recognised "+expectedFieldName+ " and page name" +pageName);
				break;
			}	
			
		}catch(Exception e) {
			Assert.fail("An error occured validating the fields  "+expectedFieldName+ " and on page name " +pageName);
		}
	}
	
	@Then("the {string} field is displayed")
	public void the_field_is_displayed(String fieldName) {
	    
		try {
		
			fieldName = fieldName.toLowerCase().trim();
			
			switch (fieldName) {
			case "heating":
				WebElement heatingSource = getWebElementByXpath(".//*[contains(text(),'My heating source is...')]");
				heatingSource.getText();
				assertTrue(heatingSource.isDisplayed());
				break;

			case "paper billing":
				WebElement paperBilling = getWebElementByXpath(".//span[@class='checkbox__custom-checkbox']");
				paperBilling.getText();
				assertTrue(paperBilling.isDisplayed());
				break;

				
			default:
				Assert.fail("Field was not recognised "+fieldName);
				break;
			}
		
		}catch(Exception e) {
			
			Assert.fail("An error occured with validating the field "+fieldName);
		}
		
	}
	@When("user selects the size of their home {string}")
    public void user_selects_the_size_of_their_home(String houseSize) {
     
		try {
			
			houseSize=houseSize.toLowerCase().trim();
								
			switch (houseSize) {
			case "large":
				
				if(isElementPresent(By.xpath(".//div[@class='radio__wrap active']/input[@id='large-home']"))) {
					
					System.out.println("Don't do anything");
					
				}else {
					
				WebElement	largeHouse = getWebElementByXpath(".//input[@id='large-home']/following-sibling::span[@class='radio__fake-radio']");
				largeHouse.click();
				
				}
				break;
				
			case "medium":
				
				if(isElementPresent(By.xpath(".//div[@class='radio__wrap active']/input[@id='medium-home']"))) {
					
					System.out.println("Don't do anything");
					
				}else {
					
					WebElement mediumHouse = getWebElementByXpath(".//input[@id='medium-home']/following-sibling::span[@class='radio__fake-radio']");
					mediumHouse.click();
				
				}
				break;
			
			case "small":
				
				if(isElementPresent(By.xpath(".//div[@class='radio__wrap active']/input[@id='small-home']"))) {
					
					System.out.println("Don't do anything");
					
				}else {
					
				WebElement smallHouse = getWebElementByXpath(".//input[@id='small-home']/following-sibling::span[@class='radio__fake-radio']");
					smallHouse.click();
				}
				
				break;
	
			default:
				Assert.fail("Could not find the house size to select "+houseSize);
				break;
			}			
				System.out.println("Selecting house size "+houseSize);
		
		}catch(Exception e) {
			
			Assert.fail("An error occured selecting the house size "+houseSize);
		}
    	
    }
	 

	@Given("user is on the register page")
	public void user_is_on_the_register_page() throws InterruptedException {
	
		user_validates_the_page_heading_two( "Your switch is helping raise money for people who need it");
	   	    
	}


	@Then("user validates the {string} congrats popup {string}")
	public void user_validates_the_congrats_popup(String congratsPopup, String expectedCongratsTitle) {

		try {
			
			String actualCongratsTitle = getWebElementByXpath(".//h2").getText();
					
			switch (congratsPopup) {
			case "switch now":
				Assert.assertEquals("Expected switch now congrats title is "+expectedCongratsTitle, "Expected switch now congrats title is "+actualCongratsTitle);
				break;
			
			case "delayed":
				Assert.assertEquals("Expected delayed congrats title is "+expectedCongratsTitle, "Expected delayed congrats title is "+actualCongratsTitle);
				break;
				
			default:
				Assert.fail("The congrats popup has not been recognised "+congratsPopup);
				break;
			}
				System.out.println("Validating the "+congratsPopup+" with title "+expectedCongratsTitle);
			
		}catch(Exception e) {
			
			Assert.fail("An error occured with validating the congrats popup "+expectedCongratsTitle);
		}	
	}
	
	@Then("validates the text in the {string} congrats popup {string}")
	public void validates_the_text_in_the_congrats_popup(String typeOfCongrats, String expectedCongratsText) {
	
		switch (typeOfCongrats) {
		case "switch now":
			String actualSwitchNowCongratsText = getWebElementByXpath(".//span[@class='popup__title--small blue']").getText();
			Assert.assertEquals("The expected switch now congrats text should be "+expectedCongratsText, "The expected switch now congrats text should be "+actualSwitchNowCongratsText);
			break;
			
		case "delayed":
			String actualDelayedCongratsText = getWebElementByXpath(".//h4[@class='delta blue']").getText();
			Assert.assertEquals("The expected switch later congrats text should be "+expectedCongratsText, "The expected switch later congrats text should be "+actualDelayedCongratsText);
			break;

		default:
			Assert.fail("An error occured with validating the congrats text "+typeOfCongrats+" with actual text "+expectedCongratsText);
			break;
		}
	}

	@Then("there is at least one result displayed")
	public void there_is_at_least_one_result_displayed() {
	    
		try{
			
			String resultsXpath="";
			
			resultsXpath=".//ol[@class='results-list']/li";
							
			List<WebElement> resultElements=driver.findElements(By.xpath(resultsXpath));
			
			if(resultElements.size() > 0){
				
				Assert.assertEquals("There should be 1 or more results displayed", true, resultElements.size() > 0);
				
			}else{
				Assert.fail("Couldn't find any results");
				
			}	System.out.println("There is more than 1 result displayed");
			
			
		}catch(Exception e){
			
			Assert.fail("An error occured validating results");
			
		}			
	}
	
	//switch later 
	@Given("user has selected to switch {string}")
	public void user_has_selected_to_switch(String delayed) throws InterruptedException {
		
		try {
			if(delayed.equalsIgnoreCase("later")) {
				
				user_sees_the_prompt("delayed");
				user_selects_the_radio_button("switch later");
				user_selects_the_button("submit");				
				
			}else if (delayed.equalsIgnoreCase("now")) {
				
				user_sees_the_prompt("delayed");
				user_selects_the_radio_button("switch now");
				user_selects_the_button("submit");				
					
			}else {
				
				Assert.fail("Could not recognise the delayed option "+delayed);	
			}
	
		}catch(Exception e) {
			
			Assert.fail("An error occured, could not select the delayed option "+delayed);	
		}
	}
	
	@Given("the threshold field is {string}")
	public void the_threshold_field_is(String displayed) {
	    
		WebElement thresholdField = getWebElementByXpath(".//form[@class='dashboard__variable-tariff']/h3");
		
		try {

			if(displayed.equalsIgnoreCase("displayed")) {
					
				Assert.assertTrue("The Threshold field is displayed", thresholdField.isDisplayed());
				
			}else if(displayed.equalsIgnoreCase("not displayed")) {
				
				Assert.assertFalse("The Threshold field should not be displayed", thresholdField.isDisplayed());
		
			}else {
				
				Assert.fail("Could not locate the variable tariff threshold field");
			}	
			
		}catch (NoSuchElementException e) {
			
			Assert.assertFalse(thresholdField.isDisplayed());
			
		} catch (Exception e) {
			
			Assert.fail("An error occured - Variable tariff threshold field not found "+displayed);
		
		}	
	}

	@Given("user has selected confirm in the congrats popup")
	public void user_has_selected_confirm_in_the_congrats_popup() throws InterruptedException {
	  
		Thread.sleep(8000);
		user_selects_the_button("Look at your migration");
		user_validates_the_URL("dashboard");
	   
	}
				
	
	@Given("a returning user wants to start again with a known postcode {string},{string},{string},{string},{string}")
	public void a_returning_user_wants_to_start_again_with_a_known_postcode(String pageHeading, String postcode, String typeOfUser, String buttonName, String pageHeadingEnergy) throws InterruptedException {
	   
		user_validates_the_page_heading(pageHeading);
		user_enters_their_postcode(postcode);
		user_selects_the_type_of_user_button(typeOfUser);
		user_selects_the_button(buttonName);
		user_validates_the_page_heading(pageHeadingEnergy);
		
	}

	@Given("a returning user wants to start again with a unknown postcode {string},{string},{string},{string},{string},{string}")
	public void a_returning_user_wants_to_start_again_with_a_unknown_postcode(String pageHeading, String postcode, String typeOfUser, String regionName, String buttonName, String pageHeadingEnergy) throws InterruptedException {

		user_validates_the_page_heading(pageHeading);
		user_enters_their_postcode(postcode);
		user_selects_the_type_of_user_button(typeOfUser);
		user_selects_the_region(regionName);
		user_selects_the_button(buttonName);
		user_validates_the_page_heading(pageHeadingEnergy);

	}

	//results page
	@Given("user has selected {string} option")
	public void user_has_selected_option(String radio) throws InterruptedException {
	
		try {
			
			radio=radio.toLowerCase().trim();

			if(radio.equalsIgnoreCase("paper billing")) {
			
				user_selects_the_radio_button("paper billing");
				user_validates_the_page_text("Paper billing");
				user_confirms_the_radio_is_selected("paper billing");
				user_validates_the_metadata_field("Paper billing");
				
			}else if(radio.equalsIgnoreCase("whd")) {
				
				user_selects_the_radio_button("whd");
				user_validates_the_page_text("Qualify for Warm Home Discount");
				user_confirms_the_radio_is_selected("whd");
				user_validates_the_metadata_field("WHD");
			
			}else if (radio.equalsIgnoreCase("ratings")) {
				
				user_selects_the_radio_button("ratings");
				user_validates_the_page_text("High Customer Service Rating");
				user_confirms_the_radio_is_selected("ratings");
				user_validates_the_metadata_field("Top rated");		
				
			}else {
				
				Assert.fail("Option was not recognised "+radio);	
			}
			
		}catch(Exception e) {
			
			Assert.fail("An error occured with selecting Option "+radio);
		}
	}
	
	@Given("user validates the address {string}")
	public void user_validates_the_address(String address) {
	 
		try {
		
			Thread.sleep(5000);
		   if(!isNullOrEmpty(address)) {
			   
			   String actualAddress = getWebElementByXpath(".//p[@class='paragraph fw-medium']").getText();
				
			   	System.out.println("validating address "+actualAddress );
				Assert.assertEquals(address, actualAddress);
				
		   }
	   
	   }catch(Exception e) {
		   
		   Assert.fail("An error occured with validating the address on the dashboard "+address);
	   }
	}
	
	
	//submit button should be displayed
	//region field should be displayed
//	@And("the {string} field is {string}")
	@Then("the {string} should be {string}")
	public void the_should_be(String item, String buttonState) {
	   
		try {	
			webElement1 = getWebElementByXpath(".//button[@class='button--primary-v3']");
			webElement2 = getWebElementByXpath(".//button[@class='button--primary-v3 disabled']");
			
			switch (item) {
			
			case "submit button":
				
				if(buttonState.equalsIgnoreCase("enabled")) {
					
					Assert.assertTrue(webElement1.isEnabled());
			
				}else if(buttonState.equalsIgnoreCase("disabled")) {
					
					Assert.assertFalse("Button should be disabled ", !webElement1.isEnabled());
					
				}else {
					
					Assert.fail("The button name "+item+" could not be recognised");
				}	
				break;
	
			case "region field":
				
				if(buttonState.equalsIgnoreCase("displayed")) {
					
					webElement1 = getWebElementByXpath(".//div[@id='region-select']");
					
					Assert.assertTrue(webElement1.isDisplayed());
					
				}else if(buttonState.equalsIgnoreCase("not displayed")) {
					
					System.out.println("Is not displayed");
					
				}else {
					
					Assert.fail("The button name "+item+" could not be validated");
				}	
				break;
				
			case "paper billing":
	
				if(buttonState.equalsIgnoreCase("displayed")) {
					WebElement regionField = driver.findElement(By.xpath(".//div['form-control dashboard__paper-pref']/label[@class='checkbox__label']"));
					Assert.assertEquals(true, regionField.isDisplayed());
					System.out.println("Paper bill is displayed");
					
					}else if(buttonState.equalsIgnoreCase("not displayed")) {
						
						System.out.println("Paper bill is not displayed1");
						Assert.assertEquals(false, isElementPresent(By.xpath(".//div['form-control dashboard__paper-pref']/label[@class='checkbox__label']")));
						System.out.println("Paper bill is not displayed2");
				}				
				break;
				
				
			default:
				Assert.fail("The button name "+item+" could not be recognised and button state "+buttonState);
				break;
			
			} System.out.println("Validating the button name "+item+" and button state "+buttonState);	
		
		}catch(Exception e) {
			
			Assert.fail("An error occured with validating the button name "+item+" and button state "+buttonState);
			
		}
	}

	@When("user presses the enter key")
	public void user_presses_the_enter_key() {

		String url = driver.getCurrentUrl();
		String pageUrl = "https://rewritedev.migrate.co.uk/signup/create-account";
		
		if(url.equalsIgnoreCase(pageUrl)) {
			
			driver.findElement(By.id("passwordConfirm")).sendKeys(Keys.ENTER);		
			
		}else {
			
			driver.findElement(By.id("postcode")).sendKeys(Keys.ENTER);		
			
		}		
	}

	@When("user presses the space bar")
	public void user_presses_the_space_bar() {
		
		getWebElementByXpath(".//input[@id='postcode']").sendKeys(" ");

	}
	
	@When("user presses the back key")
	public void user_presses_the_back_key() {
		
		String url = driver.getCurrentUrl();
		String pageUrl = "https://rewritedev.migrate.co.uk/signup/create-account";
		
		if(url.equalsIgnoreCase(pageUrl)) {
			
			getWebElementByXpath(".//input[@id='passwordConfirm']").sendKeys(Keys.chord(Keys.CONTROL, "a"), " ");
		
		}else {
			getWebElementByXpath(".//input[@id='postcode']").clear();
		}System.out.println("Pressing the back key");

	}
	
	//Accounts
	@Given("user searches for search term {string}")
	public void user_searches_for_search_term(String searchTerm) {
	  
		
		WebElement searchField = getWebElementByXpath(".//input[@id='Search']");
		searchField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
		searchField.sendKeys(searchTerm);
		
		System.out.println("Searches for search term "+searchTerm);
		
	}

	@Then("address {string} is {string}")
	public void address_is(String address, String displayed) {

		String getAddress = getWebElementByXpath(".//span[@class='accounts-page__address']").getText();
		
		System.out.println("Address should be displayed");
		Assert.assertEquals("Address is displayed ",address, getAddress);
		
	}

	@Then("selects an address {string}")
	public void selects_an_address(String addresss) {
	  
		WebElement selectAddress = getWebElementByXpath(".//span[@class='accounts-page__address']/parent::button");
		selectAddress.click();
		System.out.println("Selecting the address "+addresss);
		
	}

	//results
	@Then("user sees the route info message {string}")
	public void user_sees_the_route_info_message(String routeInfoText) {
	    
		try {
			
			if(routeInfoText.equalsIgnoreCase("None")) {
				
				Assert.assertFalse(isElementPresent(By.xpath(".//p[@class='results__nobill-disclaimer']")));
				System.out.println("No message should be displayed");
			
			}else {
				
				String actualRouteInfo = driver.findElement(By.xpath(".//p[@class='results__nobill-disclaimer']")).getText();
				Assert.assertEquals(routeInfoText, actualRouteInfo);
			}
		
		}catch(Exception e) {
			
			Assert.fail("Element not recognised");
		}
		
	}

	
	@Then("user selects the tariff {string}")
	public void user_selects_the_tariff(String tariffName) {
	
		
	}

}
	

