When('I navigate to the-internet.herokuapp') do
    
    @browser.goto 'http://admin:admin@the-internet.herokuapp.com/basic_auth'

end

Then('I have authenticated') do
    @browser.div(class: 'example')
end
