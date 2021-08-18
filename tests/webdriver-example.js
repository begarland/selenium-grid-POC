const webdriver = require('selenium-webdriver');

console.log('attempting to run...');

function findGoogle(browser = 'chrome') {
  let driver;

  if (browser !== 'internet_explorer') {
    driver = new webdriver.Builder() //Creating a driver
      .forBrowser(browser)
      .usingServer('http://localhost:4444/wd/hub') //Register the hub
      .build();
  } else {
    driver = new webdriver.Builder() //Creating a driver
      .forBrowser(browser, '11')
      .usingServer('http://localhost:4444/wd/hub') //Register the hub
      .build();
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
