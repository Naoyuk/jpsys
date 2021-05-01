# JpSys


[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

JpSys is a private system of JpGoods' order, purchase, management of suppliers, customers and items.

* Ruby version
2.7.2

## How to set up JpSys

JpSys uses docker-compose.

* `$ git clone https://github.com/Naoyuk/jpsys.git`
* `$ cd jpsys`
* `$ docker-compose run web rails db:create`
* `$ docker-compose run web rails db:migrate`
* `$ docker-compose run web bundle exec rake wabpacker:install`
* `$ docker-compose up`
