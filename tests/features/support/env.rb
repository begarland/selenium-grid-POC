require 'selenium-webdriver'

def browser_name
  (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
end

def host
  (ENV['HOST'] ||= 'localhost').downcase.to_sym
end

def browser_version
  (ENV['BROWSER_VERSION'] ||= '91.0').downcase.to_sym
end

def platform
  (ENV['PLATFORM'] ||= 'macOS 11').downcase.to_sym
end
  

# Selenium::WebDriver.logger.level = :debug

