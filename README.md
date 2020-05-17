# ATVdetails

Store some ATV stuff (rom/pd/rgc/pogo/magisk version and subset of PD and RGC settings) to database on daily basis.

1. clone this: ``git clone https://github.com/dkmur/ATVdetails.git``
2. create table: ``mysql database < create_table.sql``
3. copy config: ``cp config.ini.example config.ini`` and fill out details
4. execute: ``./update`` and/or add it to crontab to run daily

Note: update script will delete everything in MAD update_log.json
