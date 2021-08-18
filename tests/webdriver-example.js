const webdriver = require('selenium-webdriver');
const ie = require('selenium-webdriver/ie');

let options = new ie.Options();
options.addBrowserCommandSwitches('-k');
options.addBrowserCommandSwitches('-private');
options.forceCreateProcessApi(true);

console.log('attempting to run...');

function findGoogle(browser = 'chrome') {
  let driver;

  if (browser !== 'internet_explorer') {
    driver = new webdriver.Builder() //Creating a driver
      .forBrowser(browser)
      .usingServer('http://localhost:4444/wd/hub') //Register the hub
      .build();
  } else {
    driver = await env.builder().setIeOptions(options).build();
  }

  console.log('weve created the driver', browser);

  driver
    .get('http://www.google.com') //Opening Google.com
    .then(() => driver.findElement(webdriver.By.name('q')).sendKeys('hello\n'))
    // .then(() => driver.findElement(webdriver.By.name('this-should-not-exist')))
    .catch((err) => {
      console.log(err);
    })
    .finally(() => {
      console.log(`${browser} is done!`);
      driver.quit();
    }); //Quit the driver
}

module.exports = {
  findGoogle,
};
