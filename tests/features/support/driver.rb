
require 'watir'
require 'webdrivers'

module Driver
    def self.create(browser)
      opts = {}

      if browser.to_sym == :firefox
        opts = {
          accept_insecure_certs: true, 
        }
      end

      if browser.to_sym == :safari
        opts = {
          safariIgnoreFraudWarning: true
      }
      end

      @driver = Watir::Browser.new browser.to_sym,
                                   url: 'http://localhost:4444/wd/hub',
                                   capabilities: opts
                                  #  headless: true
    end

    def self.get
      @driver
    end
end

