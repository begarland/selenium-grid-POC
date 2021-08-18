const { Platform } = require('selenium-webdriver/lib/capabilities');
const tests = require('./webdriver-example');

const { findGoogle } = tests;

findGoogle('chrome');
findGoogle('firefox');
findGoogle('internet explorer', null, Platform.WINDOWS);
