Before do |scenario|
    # Initalize the Browser
    @browser = Driver.create(browser_name)
    # Resize browser        
    Watir.default_timeout = 90        
    @browser.window.resize_to(1750, 1000)
    
end


After do |scenario|
    log(browser_name.to_s)
    log('done!')
    @browser.close
end
