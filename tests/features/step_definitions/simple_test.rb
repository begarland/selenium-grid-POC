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

