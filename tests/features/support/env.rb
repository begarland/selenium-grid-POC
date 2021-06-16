require 'selenium-webdriver'

def browser_name
  (ENV['BROWSER'] ||= 'safari').downcase.to_sym
end

def host
  (ENV['HOST'] ||= 'localhost').downcase.to_sym
end
  

# Selenium::WebDriver.logger.level = :debug

