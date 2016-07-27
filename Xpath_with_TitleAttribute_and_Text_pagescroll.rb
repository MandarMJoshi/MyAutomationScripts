require "Selenium-WebDriver"

driver=Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait=30

begin
  driver.get "https://www.flipkart.com"
  driver.find_element(:xpath,"//span[text()='Electronics']").click
  driver.find_element(:xpath,"//a[@title='Mouse']").click
  grid_elements=driver.find_elements(:xpath,"//div[@class='gd-row browse-grid-row']")
   sleep 5
  grid_elements[2].location_once_scrolled_into_view
  driver.manage.window.maximize
  driver.find_element(:xpath,"//a[@title='Digi India Blkmose Wireless Optical Mouse (USB, Orange) ']").click
  sleep 5

rescue Exception=>e
  puts e

ensure
  driver.quit
end
