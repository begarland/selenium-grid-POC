
require 'watir'
require 'webdrivers'

require 'dotenv'
Dotenv.load('.env')

module Driver
    def self.create(host, browser)
      case host
      when :saucelabs
        opts = {
          'sauce:options': {
            username: ENV['SAUCE_USERNAME'],
            access_key: ENV['SAUCE_ACCESS_KEY'],
            name: 'simple_test',
            idle_timeout: 60,
            tunnelIdentifier: 'test-tunnel',
            extended_debugging: true,
            capture_performance: true
          }
        }


        @driver = Watir::Browser.new browser.to_sym,
                                    url: 'https://ondemand.us-west-1.saucelabs.com:443/wd/hub',
                                    capabilities: opts
                                    #  headless: true

      when :localhost
        # uses google chrome by default
        @driver = Watir::Browser.new browser.to_sym
      end
    end

    def self.get
      @driver
    end
end

