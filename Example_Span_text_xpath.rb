require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path = "path\\to\\chrome\\exe"
driver=Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait=30

begin
  driver.get "http://www.flipkart.com/"
  driver.find_element(:xpath,".//span[text()='Men']").click
  driver.find_element(:css,".cart-label").click
  driver.find_element(:xpath,".//*[text()='Continue Shopping']").click
  sleep 5
  
rescue Exception =>e
  puts e
  
ensure
  driver.quit
end
