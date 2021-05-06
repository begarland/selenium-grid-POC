Before do |scenario|
    # Initalize the Browser
    @browser = Driver.create(browser_name)
    # Resize browser                              
    @browser.window.resize_to(1750, 1000)
end

When('I navigate to a.testaddressbook.com') do
    @browser.goto 'a.testaddressbook.com'
end

Then('I click sign in') do
    @browser.link(id: 'sign-in').click
end

Then('I sign in') do
    @browser.text_field(data_test: 'email').set 'watir_example@example.com'
    @browser.text_field(data_test: 'password').set 'password'
    @browser.button(name: 'commit').click
end

After do |scenario|
    log(browser_name.to_s)
    log('done!')
    @browser.close

end
