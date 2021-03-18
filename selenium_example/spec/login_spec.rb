# filename: spec/login_spec.rb
require 'selenium-webdriver'
require_relative '../pages/login'

describe 'Login' do

    before(:each) do
      driver_path = File.join(Dir.pwd, 'vendor', 'chromedriver') 
      if File.file? driver_path
        service = Selenium::WebDriver::Service.chrome(path: driver_path)
        @driver = Selenium::WebDriver.for :chrome, service: service 
      else
        @driver = Selenium::WebDriver.for :chrome
      end

      @login = Login.new(@driver)
    end
    after(:each) do 
      @driver.quit
    end
    

  it 'succeeded' do
    @login.with('tomsmith', 'SuperSecretPassword!') 
    expect(@login.success_message_present?).to be_truthy
  end


  it 'failed' do
    @login.with('asdf', 'asdf') 
    expect(@login.failure_message_present?).to be_truthy
  end
  
  
end