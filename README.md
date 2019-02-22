# SE-498_01

- See `react-app` for the frontend app
- See `rails-app` for the backend app

# Development Environment Setup:

## From within the root directory, `SE-498_01`, run the following command
```shell
$ cp rails-app/config/database.yml.sample rails-app/config/database.yml
```

## To start the server from scratch, run the following
- From within the rails-app folder
```shell
$ docker-compose -f ../docker-compose.yml up react db
$ bin/setup
$ bundle exec rails s
```


## To start the severs with `docker-compose`, run the following
- Within `rails-app/config/database.yml`, under `development`, change `host: localhost` to `host:db`
- From within the root directory `SE-498_01`, run the following
```shell
$ docker-compose up
$ docker-compose run web bundle exec rails db:drop db:setup
```
- Access `react-app` through `localhost:3001`
- Access `rails-app` through `localhost:3000`
