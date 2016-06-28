require 'selenium-webdriver'
require 'rspec'
include RSpec::Matchers.dup

driver=Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait = 2

begin
driver.get "https://www.toolsqa.com"
menu_element=driver.find_element(:css,"#main-nav>li:nth-child(2)>a")
driver.action.move_to(menu_element).perform
driver.find_element(:css,".sub-nav>li:nth-child(8)").click
expect(driver.find_element(:css,".entry-title").text).to eq("Java Tutorial")

rescue  Exception => e
puts e.message

ensure
driver.quit
end