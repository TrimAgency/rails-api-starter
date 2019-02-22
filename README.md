# Trim Starter Ruby on Rails API

Project management can be found in [*Asana*](URL_HERE)

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

- If image uploading capabilities are needed:
    - Add AWS keys in `application.yml`
    - Uncomment fog configuration in `config/initializers/carrierwave.rb`

- Change the app name and other references from TRIM Starter to the new app name

- Update this README with the Asana URL

## Development

### Docker
This app is dockerized solely for development environment normalization. Docker
is not used for deployment to Heroku.

* `docker-compose build` - build the containerized app
* `docker-compose up` - start the app on localhost:3000

### Docker Compose
Prefix commands with `docker-compose run app` to run them against the application 
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

### Workflow
* The `develop` branch is used for development, submit PR requests to this branch, not `master`.  
* Staging will automatically pull latest updates from the `develop` branch.
* Deployments to production are performed via Heroku deploy button from `master` branch.

### Creating a CSV of Users
1. From Heroku, create a backup of the database and save it to your machine with the following:

```
heroku pg:backups:capture -a app-name-here
heroku pg:backups:download -a app-name-here
```

2. Move the `latest.dump` file to the root of your repo, and run the following in the terminal after the docker container has been created. 

```
docker-compose exec -T postgres pg_restore --verbose --clean --no-acl --no-owner -U postgres -d APP_NAME_development < ./latest.dump
```

3. Run the task with `rake api_user_list_csv:run`. Save the CSV generated to another folder in your machine. Remove the latest.dump file, do not commit it.

