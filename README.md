# Trim Starter Ruby on Rails API

## Setup
This is the start for all of our Ruby on Rails APIs.  
- Clone this into the directory
of your choice by appending the folder name to your git clone command.

- cd into your directory and run $ `docker-compose build`

- $ `docker-compose run app bash` - runs the shell

- $ `rake db:create db:migrate` - intitalizes the database

- Rename the Rails app by:
    - Changing the module name in `config/application.rb`
    - Changing the database names in `config/database.yml`

- In `/config` rename `sample-application.yml` to `application.yml` and add the appropriate ENV's

- If Image uploading capabilities are needed:
    - Add AWS keys in `application.yml`
    - Uncomment fog configuration in `config/initializers/carrierwave.rb`

## Development

### Docker
This app is dockerized soley for development environment normalization.  Docker
is not used for deployment to Heroku.

* `docker-compose build` - build the containerized app
* `docker-compose up` - start the app on localhost:3000

### Docker Compose
Prefix commands with `docker-compose run app` to run them agaist the application 
container. For example:

* `docker-compose run app rails console` - runs the rails console
* `docker-compose run app bash` - runs the shell

### Rspec
* `docker-compose run app rspec` - run rpsec tests. Alternatively, open a bash
  prompt (see above) and run `rspec`.

### Postgres
* `docker-compose run app rake db:setup`

### Debugging with Pry and Docker
* `docker ps` - get the app container id
* `docker attach container_id` - attach to container stdin/out using the id from the above step.

## Production deploy
 Do not keep production secrets in the unencrypted secrets file.
 Instead, either read values from the environment.
 Or, use `bin/rails secrets:setup` to configure encrypted secrets.
 Then in `secrets.yml` delete or move the  `production:` environment secrets over there.

- Set ENV['TRIM_STARTER_DATABASE_PASSWORD']
