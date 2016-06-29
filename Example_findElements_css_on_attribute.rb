require 'selenium-webdriver'
require 'rspec'
include RSpec::Matchers.dup

driver=Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait=10

begin
driver.get "http://www.flipkart.com/"

element=driver.find_element(:css,".Wbt_B2:nth-child(2)")
driver.action.move_to(element).perform
driver.find_element(:css,"._3ZgIXy.required-tracking[data-tracking-id='casio']").click
elements=driver.find_elements(:css,".s-unit.merch-carousel.no-js>li")
expect(elements.count).to eq(5)

rescue Exception => e
puts e

ensure
driver.quit
end

