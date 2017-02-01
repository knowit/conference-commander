## Ruby version

Latest and greatest, ie MRI v2.4.0

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

The Crowd integration expects the following environment variables to be set:

    CROWD_APP_NAME
    CROWD_APP_PASSWORD
    CROWD_ENDPOINT_URL

Define these in your `.env` file and they are automatically loaded during startup (see examples in `example.env`).

