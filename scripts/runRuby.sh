#! /bin/bash

gem install watir
gem install webdrivers
gem install faker

bundle install

cucumber BROWSER=chrome &
cucumber BROWSER=firefox &
cucumber BROWSER=safari &