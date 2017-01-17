## Ruby version

Latest and greatest, ie MRI v2.3.3

## System dependencies

## Configuration

## Database creation

### macOS

Install and start a local Postgre server using [dock](https://github.com/bripkens/dock)

    $ brew tap bripkens/dock
    $ brew install dock
    $ dock postgres

## Database initialization

Create database and seed some data:

    $ export MY_USER=postgres
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed

## Bower

$ npm install -g Bower
$ rake bower:install

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

## Crowd integration

The crowd integration expects the following parameters to be set in the environment:

    CROWD_APP_NAME
    CROWD_APP_PASSWORD
    CROWD_ENDPOINT_URL

These can be set in .env, for instance.
