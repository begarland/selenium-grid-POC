const webdriver = require('selenium-webdriver');

console.log('attempting to run...');

function findGoogle(browser = 'chrome') {
  console.log('the browser is', browser);
  if (browser == 'internet explorer') {
    console.log('hello, this will break');
  }
  const driver = new webdriver.Builder() //Creating a driver
    .forBrowser(browser)
    .usingServer('http://localhost:4444/wd/hub') //Register the hub
    .build();
  if (browser !== 'internet explorer') {
    driver
      .get('http://www.google.com') //Opening Google.com
      .then(() => {
        driver.findElement(webdriver.By.name('q')).sendKeys('hello\n');
        console.log(`${browser} has searched!`);
      })
      // .then(() => driver.findElement(webdriver.By.name("this-should-not-exist")))
      .catch((err) => {
        // console.log(err)
        console.log(`${browser} has errored!`);
        throw Error(err);
      })
      .finally(() => {
        console.log(`${browser} is done!`);
        driver.quit();
      }); //Quit the driver
  } else {
    driver.quit();
  }
}

module.exports = {
  findGoogle,
};
