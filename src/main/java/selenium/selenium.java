package selenium;




import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class selenium {

    public static void main(String[] args) {
        // Set system property for ChromeDriver with proper escaped backslashes
    	  System.setProperty("webdriver.chrome.driver", "C:\\selenium\\chromedriver-win32\\chromedriver-win32\\chromedriver.exe");
          
        // Create a new instance of ChromeDriver
        WebDriver driver = new ChromeDriver();

        // Navigate to your URL
        driver.get("http://localhost:8082/Mega_city_cab_service/Login.jsp");
        System.out.println(driver.getTitle());

       
    }
}