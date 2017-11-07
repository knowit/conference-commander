## System dependencies

* Ruby 2.4.0
* bundler: `gem install bundler`
* Node `brew install node`
* yarn: `brew install yarn`

## Install dependencies

    $ bundle install
    $ yarn install

## Configurations

Define your config variables in a file `.env` that are automatically loaded during server startup.
There is a file `example.env` that can be used as a template:

    $ cp example.env .env

You need to provide the correct values for `CROWD_APP_PASSWORD` and `CROWD_ENDPOINT_URL`.
Ask someone who knows :-)

## Database creation

### macOS

Install and start a local Postgres server using [dock](https://github.com/bripkens/dock)

    $ brew tap bripkens/dock
    $ brew install dock
    $ dock postgres

## Database initialization

Create database, run migrations and seed some data:

    $ rails db:reset

## Running app in development

There are two servers that needs to be running.

**Option 1:** Install and run [Hivemind](https://github.com/DarthSim/hivemind) (based on [foreman](https://github.com/ddollar/foreman) but without some of its caveats).

    $ brew install hivemind
    # Run processes defined in `Procfile`
    $ hivemind

**Option 2:** Run the two servers in separate terminal windows:

    $ bin/webpack-dev-server
    $ rails s

Open the app running on [http://localhost:5100]

## How to run the test suite

...

## Services (job queues, cache servers, search engines, etc.)

...

## Deployment instructions

...

## Crowd integration

...