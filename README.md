# StOIC

The Stoic Online Interactive Commentary of Epictetus' Enchiridion.

## Installation

### Requirements

* Ruby 2.6.0
* Node 13.9.0

### Setup

* `gem install bundler`
* `gem install`
* `yarn install`
* `bundle exec rails db:create`
* `bundle exec rails db:migrate`
* `bundle exec rails csv:reload`

### Configuration

If running in production you will need to set the following environment variables:

* `SECRET_KEY_BASE`
* `HOST`
* `FROM_EMAIL`

## Running the application

* `bundle exec rails server`

## Running tests

* `RAILS_ENV=test bundle exec rails db:migrate`
* `RAILS_ENV=test bundle exec rails csv:reload`
* `bundle exec rspec`

## Bugs and feature requests

For any bugs or feature requests, please create
[a GitHub issue](https://github.com/zfletch/stoic-commentary/issues).
