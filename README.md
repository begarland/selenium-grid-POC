# Selenium Grid POC

## Pre-reqs:

- Must be running MacOSX

- Install Java: https://java.com/en/download/

- Download the correct drivers for your versions of Firefox and Chrome and replace the files in ./scripts/drivers.
  This is a workaround for a MacOSX bug where packages downloaded from the internet are automatically blocked.

Firefox:
https://github.com/mozilla/geckodriver/releases

Chromedriver:
https://chromedriver.chromium.org/

Open System Preferences > Security and Privacy and click to open the lock.

`cd tests` and run `cucumber BROWSER=chrome` and follow the prompts to allow chromedriver to be used on your machine. Be sure to `allow anyway` in the Security and Privacy settings.
you may need to run the above command twice.

Repeat the above process for `cucumber BROWSER=firefox`.

- Update `scripts/startGridLocally.command` to point to the correct file path on your machine.

- Make the local launch file an executable:

run `chmod u+x scripts/startGridLocally.command`. You should only need to do this once.

---

## To Run locally:

Once Java and the drivers have been installed on your machine and the startGridLocally script has been made an executable, open the scripts file in finder and double click it.

It should open 3 terminal windows, one details window, and one each the hub and the standalone node.

Once the hub is running, you can run the bash script to kick of the tests. If you have not done so already,

`cd tests` and `bundle install`

finally, to kick off the scripts run, `bash runLocally.sh`
