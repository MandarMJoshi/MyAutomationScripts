require 'selenium-webdriver'
require 'rspec'
include RSpec::Matchers.dup

driver=Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait= 5

begin
driver.get "https://www.avvo.com"
element=driver.find_element(:css,".nav-section-action[href='/find-a-lawyer']")
driver.action.move_to(element).perform
driver.find_element(:css,".btn.btn-secondary.btn-lg").click

driver.manage.window.maximize
driver.find_element(:css,".form-control.js-onebox-search.js-onebox-search-textfield[data-reactid='.0.0.0.0.1']").send_keys "lawyer\n"
url=driver.current_url.to_s
expect(url).to match(/[\w\:\/\.\?\=]*lawyer$/)

rescue Exception => e
puts e.message

ensure
driver.quit
end
