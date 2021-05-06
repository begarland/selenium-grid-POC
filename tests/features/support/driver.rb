
require 'watir'
require 'webdrivers'

module Driver
    def self.create(browser)
      args = ['--ignore-certificate-errors', '--no-sandbox', '--disable-dev-shm-usage']

      @driver = Watir::Browser.new browser.to_sym,
                                   url: 'http://localhost:4444/wd/hub'
                                  #  options: { args: args },
                                  #  headless: true
    end

    def self.get
      @driver
    end
end

