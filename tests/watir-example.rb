# http://watir.com/guides/form-example/

require 'watir'
require 'webdrivers'
require 'faker'


module Driver
    def self.create(browser)
      args = ['--ignore-certificate-errors', '--no-sandbox', '--disable-dev-shm-usage']

      @driver = Watir::Browser.new browser.to_sym,
                                   url: 'http://grid_hub:4444/wd/hub',
                                   options: { args: args },
                                   headless: true
    end

    def self.get
      @driver
    end
end


def findAddressBook(browser_choice)

    # Initalize the Browser
    browser = Driver.create(browser_choice.to_sym)

    # Resize browser                              
    browser.window.resize_to(1750, 1000)

    # Navigate to Page
    browser.goto 'a.testaddressbook.com'

    # Authenticate and Navigate to the Form
    browser.link(id: 'sign-in').click
    browser.text_field(data_test: 'email').set 'watir_example@example.com'
    browser.text_field(data_test: 'password').set 'password'
    browser.button(name: 'commit').click

    # browser.link(data_test: 'i-do-not-exist').click
    
    puts browser_choice.to_s + ' is done!'
    browser.close
end

findAddressBook 'chrome'
findAddressBook 'firefox'
