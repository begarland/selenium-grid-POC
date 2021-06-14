Before do |scenario|
    # Initalize the Browser
    @browser = Driver.create(browser_name)
    # Resize browser        
    Watir.default_timeout = 90        
    @browser.window.resize_to(1750, 1000)
    @browser.execute_script("sauce:job-name=#{scenario.name}") 

end


After do |scenario|
    log(browser_name.to_s)
    log('done!')

    log(scenario.name)

    
    test_passed = scenario.passed?
    @browser.execute_script("sauce:job-result=#{test_passed}")
    @browser.close
end
