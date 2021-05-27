require 'selenium-webdriver'

def browser_name
    (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
end
  

Selenium::WebDriver.logger.level = :debug
