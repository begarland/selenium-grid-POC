
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
        opts = {prerun: {
          'executable': 'https://gist.githubusercontent.com/begarland/ff0bcff468701afdf65181c3e1c974af/raw/af9c73ab3a82feb0a71e76c95eadb3cbb739c50f/disable_fraud_warning.sh',
          'background': false
        }
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

