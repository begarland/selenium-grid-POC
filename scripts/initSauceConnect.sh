#! /bin/bash

export $(xargs <.env)

cp ./sauce/config_template.yml ./sauce/qa-config.yml
cp ./sauce/config_template.yml ./sauce/staging-config.yml
cp ./sauce/config_template.yml ./sauce/prod-config.yml

echo "api-key: $SAUCE_ACCESS_KEY" >> ./sauce/qa-config.yml
echo "user: $SAUCE_USERNAME" >> ./sauce/qa-config.yml
echo "tunnel-identifier: sn_qa_tunnel" >> ./sauce/qa-config.yml
echo "auth: ['qa.sleepnumber.com:443:$BASIC_AUTH']" >> ./sauce/qa-config.yml

echo "api-key: $SAUCE_ACCESS_KEY" >> ./sauce/staging-config.yml
echo "user: $SAUCE_USERNAME" >> ./sauce/staging-config.yml
echo "tunnel-identifier: sn_staging_tunnel" >> ./sauce/staging-config.yml
echo "auth: ['staging.sleepnumber.com:443:$BASIC_AUTH']" >> ./sauce/staging-config.yml

echo "api-key: $SAUCE_ACCESS_KEY" >> ./sauce/prod-config.yml
echo "user: $SAUCE_USERNAME" >> ./sauce/prod-config.yml
echo "tunnel-identifier: sn_prod_tunnel" >> ./sauce/prod-config.yml
echo "auth: ['sleepnumber.com:443:$BASIC_AUTH']" >> ./sauce/prod-config.yml

