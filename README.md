# Teste

<!-- [![CircleCI]()]() -->
<!-- [![Maintainability]()]() -->
<!-- [![Test Coverage]()]() -->

## Installation (Standalone)

#### 1. Install PostgreSQL

[PostgreSQL](http://postgresql.org/)

#### 2. Install Rbenv

Rbenv: [repo](https://github.com/rbenv/rbenv)

- Check that the rbenv PATH is configured correctly, according to the repo instructions.

#### 3. Install Rbenv-gemset

Rbenv-gemset: [repo](https://github.com/jf/rbenv-gemset)

#### 4. Install Ruby

```
$ rbenv install 2.5.5
```

#### 5. Install last Node version & MJML package
```
$ curl -sL https://deb.nodesource.com/setup_12.x | bash -
$ apt-get install -y nodejs && npm install -g mjml
```

If rbenv complains you don't have that ruby version, upgrade [ruby-build](https://github.com/rbenv/ruby-build#readme).

#### 6. Clone the repository & update git remote

```
$ git clone git@github.com:roavellarm/teste-api.git
$ cd teste-api
```

#### 7. `.env` and local variables

You must ask your colleagues for the correct `.env` variables.
There is values there that we CANNOT send to the github, otherwise this will
represent a secutiry flaw. If you're using Docker you also need to change
some values like `POSTGRES_HOST` (if you use Docker, you should know the values).

```
$ cp .env.sample .env
```

#### 8. Install project dependencies

```
$ bin/bundle
```
Always use this command to ensure the gems are installed in `.gems`.

#### 9. Prepare the database

```
$ bin/rails db:create db:migrate db:seed
```

#### 10. Running the server

```
$ bin/rails s
```

You can check that it worked by browsing `localhost:3000`.

## Tests/Specs

#### Running RSpec

```
$ bin/rspec
# OR for Docker
$ docker-compose run rails bin/rspec
```

The coverage will be available on the `coverage/` folder. Open `coverage/index.html` on your browser to see details.

#### Running the linter

```
$ bin/rubocop
# OR for Docker
$ docker-compose run rails bin/rubocop
```

## Deployment

### Setup

- Create a one Heroku project for Staging and another one for Production.
- Inside Heroku Apps you should add the NodeJS buildpacks (for MJML mailer templates)
  - `heroku buildpacks:add --index 1 heroku/nodejs`
- Configure the `RAILS_MASTER_KEY` env var for both heroku projects (they are the same).
- Check app names at `.circleci/config.yml` to see if they match the names on Heroku dashboard

#### Production and Staging

The URLs for production and staging are:

- https://teste-staging-api.herokuapp.com/
- https://teste-production-api.herokuapp.com/

### Staging

All commits to `master` branch will be pushed to staging by CircleCI.

### Production

Generate a new release - all tags in the format `vX`, where `X` is an integer, will be automatically pushed to production.

Example: `v1`, `v2` ... `v10` and so on.
