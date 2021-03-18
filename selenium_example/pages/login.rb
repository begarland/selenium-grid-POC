# filename: pages/login.rb
require_relative 'base_page'

class Login < BasePage

  LOGIN_FORM = {id: 'login'}
  USERNAME_INPUT  = { id: 'username' }
  PASSWORD_INPUT  = { id: 'password' }
  SUBMIT_BUTTON   = { css: 'button'  }
  SUCCESS_MESSAGE = { css: '.flash.success' }
  FAILURE_MESSAGE = { css: '.flash.error' }

  def initialize(driver)
    @driver = driver
    @driver.get 'http://the-internet.herokuapp.com/login'
    raise 'Login page not ready' unless
        @driver.find_element(LOGIN_FORM).displayed?
  end
  
  def initialize(driver)
    super
    visit '/login'
    raise 'Login page not ready' unless
        is_displayed?(LOGIN_FORM)
  end

  def with(username, password) 
    type username, USERNAME_INPUT
    type password, PASSWORD_INPUT
    click SUBMIT_BUTTON
  end

  def success_message_present?
    is_displayed? SUCCESS_MESSAGE
  end
  
  def failure_message_present?
    is_displayed? FAILURE_MESSAGE  
  end

end