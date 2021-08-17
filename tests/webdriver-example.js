const webdriver = require("selenium-webdriver");

console.log('attempting to run...')

function findGoogle(browser = "chrome") {
  console.log('the browser is', browser)
  const driver = new webdriver.Builder() //Creating a driver
    .forBrowser(browser)
    .usingServer("http://localhost:4444/wd/hub") //Register the hub
    .build();

  driver
    .get("http://www.google.com") //Opening Google.com
    .then(() => driver.findElement(webdriver.By.name("q")).sendKeys("hello\n"))
    // .then(() => driver.findElement(webdriver.By.name("this-should-not-exist")))
    .catch((err) => {
      // console.log(err)
      throw Error(err)
    })
    .finally(() => {
      console.log(`${browser} is done!`);
      driver.quit();
    }); //Quit the driver
}

module.exports = {
  findGoogle
}