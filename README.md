# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
https://upload.wikimedia.org/wikipedia/commons/9/94/MediaWiki_1.28.0_database_schema.svg

Download https://phabricator.wikimedia.org/source/mediawiki/browse/master/maintenance/tables.sql
rails new mediawiki -d mysql
rake db:create
mysql -u root -h localhost -p mediawiki_development < db/tables.sql

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
