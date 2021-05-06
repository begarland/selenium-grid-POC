require 'selenium/webdriver'
require_relative 'config'


include Config

case config[:host] 
when 'saucelabs'
  caps = Selenium::WebDriver::Remote::Capabilities.send(config[:browser_name]) 
  caps[:browser_version] = config[:browser_version]
  caps[:platform_name] = config[:platform_name]
  url = "https://#{config[:sauce_username]}:#{config[:sauce_access_key]}@ondemand.saucelabs.com/wd/hub"
  browser = Selenium::WebDriver.for(
          :remote,
          url: url,
          desired_capabilities: caps)
when 'localhost'
  case config[:browser_name] 
    when 'firefox'
      driver_path = File.join(Dir.pwd, 'vendor', 'geckodriver') 
      if File.file? driver_path
        service = Selenium::WebDriver::Service.firefox(path: driver_path) 
      end
    when 'chrome'
      driver_path = File.join(Dir.pwd, 'vendor', 'chromedriver') 
      if File.file? driver_path
        service = Selenium::WebDriver::Service.chrome(path: driver_path) 
      end
    end
    if service
      browser = Selenium::WebDriver.for config[:browser_name].to_sym, service: service
    else
      browser = Selenium::WebDriver.for config[:browser_name].to_sym 
    end
  end 

Before do |scenario|
	@browser = browser
    browser.execute_script("sauce:job-name=#{scenario.name}") 

end


After do |scenario|
    test_passed = !scenario.failed?
    browser.execute_script("sauce:job-result=#{test_passed}")
    if !test_passed
      log("Watch a video of the test at https://saucelabs.com/tests/#{browser.session_id}")
    end 
end


at_exit do
    browser.quit 
end