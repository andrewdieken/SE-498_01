# SE-498_01

- See `react-app` for the frontend app
- See `rails-app` for the backend app

# Development Environment Setup:

## From within the root directory, `SE-498_01`, run the following command
```shell
$ cp rails-app/config/database.yml.sample rails-app/config/database.yml
```

## FOR WINDOWS USERS: on initial startup
- You need to reconfigure your git settings
- Run the following command
```shell
$ git config --global core.autocrlf false
$ git clone <project>
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
$ docker-compose down
$ docker-compose up --build
$ docker-compose run web bundle exec rails db:drop db:setup
```

#### FOR MAC USERS
- Access `react-app` through `localhost:3001`
- Access `rails-app` through `localhost:3000`

#### WINDOWS USERS
- To get your Docker IP Address, run the following
```shell
$ docker-machine ip
```
- Access `react-app` through `<DOCKER_IP_ADDRESS>:3001`
- Access `rails-app` through `<DOCKER_IP_ADDRESS>:3000`

## Error Handling
- `web_1    | A server is already running. Check /app/tmp/pids/server.pid.`
Run the following commands from within the `SE-498_01` folder:
```shell
$ rm -rf rails-app/tmp/pids/
```
DB migration error run the following command within `SE-498_01` folder:
$ docker-compose run web bundle exec rails db:migrate

## Running the front end with api
- In react-app's package.json change proxy to:
For windows "proxy": "http://your docker ip:3000/"
For mac and linux "proxy": "http://web:3000/"
