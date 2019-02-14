# SE-498_01

## Environment Setup

To start the server from scratch, run the following, then navigate to localhost:3000

```bash
$ docker-compose up db
$ bin/setup
$ bundle exec rails s
```

To start use `docker-compose`, run the following:

```bash
$ docker-compose build web
$ docker-compose up
```

Make sure to change `host: db` in `database.yml`

## Developer Notes

Use `docs` folder to include any developer notes or include them in the wiki
