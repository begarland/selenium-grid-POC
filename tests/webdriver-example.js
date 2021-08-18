const webdriver = require('selenium-webdriver');
const { Platform } = require('selenium-webdriver/lib/capabilities');

console.log('attempting to run...');

function findGoogle(browser = 'chrome', version, platform = Platform.MAC) {
  console.log('the browser is', browser);
  if (browser == 'internet explorer') {
    console.log('hello, this will break');
  }
  const driver = new webdriver.Builder() //Creating a driver
    .forBrowser(browser, version, platform)
    .usingServer('http://localhost:4444/wd/hub') //Register the hub
    .build();

  driver
    .get('http://www.google.com') //Opening Google.com
    .then(() => {
      driver.findElement(webdriver.By.name('q')).sendKeys('hello\n');
    })
    // .then(() => driver.findElement(webdriver.By.name("this-should-not-exist")))
    .catch((err) => {
      // console.log(err)
      throw Error(err);
    })
    .finally(() => {
      driver.quit();
    }); //Quit the driver
}

module.exports = {
  findGoogle,
};
