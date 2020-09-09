# ATVdetails

Store some ATV stuff (rom/pd/rgc/pogo/magisk version and subset of PD and RGC settings) to database on daily basis.

1. clone this: ``git clone https://github.com/dkmur/ATVdetails.git``
2. create table: ``mysql database < create_table.sql``
3. copy config: ``cp config.ini.example config.ini`` and fill out details
4. execute: ``./update`` and/or add it to crontab to run daily

Note: update script will delete everything in MAD update_log.json, also make sure no other job is running at the time

## K8S Deployment

This assumes that your MAD server is also running in k8s, and that it's logs directory is on a persistent volume which can be mounted to the ATVdetails pod.

Also, it assumes that the `update_log.json` has been symlinked from the root of MAD to that log directory, something like this;

`ln -sf /usr/src/app/logs/update_log.json /usr/src/app/update_log.json`

Additionally, usernames and passwords should be created in a secret, thusly..

`kubectl create secret generic -n mad --from-literal=maduser=<your MAD user goes here> --from-literal=madpass<your MAD pass goes here> --from-literal=dbuser=<your MySQL user goes here> --from-literal=dbpass=<your MySQL pass goes here> atvdetails`

Rather than using the `config.ini` for all configuration, this uses a combination of the config file (to set the wait time) and environment variables for config, this is what allows configuration from k8s secrets.

Finally build the docker image;
`docker build -t atvdetails .`

Once you've ensured the prerequistes are met, and the image is built, you can simply setup the job (it's set to run every 2hr by default, but can be adjusted).

`kubectl apply -f k8s_atvdetails.yml`
