require 'selenium-webdriver'
require 'rspec'
include RSpec::Matchers.dup

driver=Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait=15

begin
  driver.get "https://www.makemytrip.com/flights/flight-ticket-reservation.html"
  driver.find_element(:css, "#roundtrip_r").click
  driver.find_element(:xpath, ".//*[@id='selorigin_s']").send_keys "pun"
  driver.find_element(:css, ".ui-autocomplete.ui-menu.ui-widget.ui-widget-content.ui-corner-all>li:nth-child(2)").click
  driver.find_element(:xpath, "//li/a[contains(text(),'(HYD')]").click
  driver.find_element(:css, "#depShow").click
  driver.find_element(:xpath, "(//a[text()='10'])[1]").click
  sleep 2
  driver.find_element(:css, "#retShow").click
  driver.find_element(:xpath, "(//a[text()='12'])[2]").click
  sleep 2
  driver.find_element(:css, "#radCabinClass").click
  driver.find_element(:xpath, "//li/a[text()='Business']").click
  driver.find_element(:xpath, ".//*[@id='search_btn']").click
  sleep 2 
rescue Exception => e
  puts e.message

ensure
  driver.quit
end