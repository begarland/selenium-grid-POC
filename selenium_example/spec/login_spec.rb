# filename: spec/login_spec.rb
require_relative 'spec_helper'
require_relative '../pages/login'

describe 'Login', :shallow do

  before(:each) do
    @login = Login.new(@driver)
  end

  it 'succeeded', :shallow do
    @login.with('tomsmith', 'SuperSecretPassword!') 
    expect(@login.success_message_present?).to be_truthy
  end

  it 'failed' do
    @login.with('asdf', 'asdf') 
    expect(@login.failure_message_present?).to be_truthy
    expect(@login.success_message_present?).to be_falsey
  end
  
end