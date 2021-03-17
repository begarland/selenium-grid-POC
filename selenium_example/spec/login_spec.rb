# filename: spec/login_spec.rb
require 'selenium-webdriver'
  describe 'Login' do

    before(:each) do
    #   driver_path = File.join(Dir.pwd, 'vendor', 'geckodriver') 
    #   puts driver_path
    #   puts File.file? driver_path
    #   if File.file? driver_path
        # service = Selenium::WebDriver::Service.chrome(path: driver_path)
        # @driver = Selenium::WebDriver.for :firefox, service: service 
    #   else
        @driver = Selenium::WebDriver.for :chrome
    #   end
    end
    after(:each) do 
      @driver.quit
    end
    it 'succeeded' do
      @driver.get 'http://the-internet.herokuapp.com/login' 
      @driver.find_element(id: 'username').send_keys('tomsmith') 
      @driver.find_element(id: 'password').send_keys('SuperSecretPassword!') 
      @driver.find_element(css: 'button').submit
    end
end