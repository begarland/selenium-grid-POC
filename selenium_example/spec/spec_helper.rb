# filename: spec/spec_helper.rb

require 'selenium-webdriver'

RSpec.configure do |c|
  c.before do |example|
    driver_path = File.join(Dir.pwd, 'vendor', 'chromedriver') 
    if File.file? driver_path
      service = Selenium::WebDriver::Service.chrome(path: driver_path)
    @driver = Selenium::WebDriver.for :chrome, service: service 
    else
      @driver = Selenium::WebDriver.for :chrome 
    end
  end
  c.after do |example| 
    @driver.quit
  end
end