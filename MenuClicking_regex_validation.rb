require 'selenium-webdriver'
require 'rspec'
include RSpec::Matchers.dup

driver= Selenium::WebDriver.for :firefox

begin
driver.get "http://www.toolsqa.com"
driver.find_element(:css,"#main-nav>li:nth-child(8)").click

#phone number
phone_number=driver.find_element(:css,".wpb_wrapper>p:nth-of-type(4)").text
expect(phone_number).to eq("+44-458565625”4)
expect("+44-7438862327").to match(/\+\d*-\d*/)

#email validation
email=driver.find_element(:css,".wpb_wrapper>p:nth-of-type(5)").text
expect(email).to match(/[a-zA-Z0-9\_\.\+\-]+\@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+/)


rescue Exception => e
puts e.message

ensure
driver.quit
end