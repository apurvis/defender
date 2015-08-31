# Start up PostgreSQL
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# push dev DB to production
heroku pg:reset DATABASE_URL --confirm d-fender
heroku pg:push defender_development DATABASE_URL --app d-fender

# Connect to psql
heroku pg:psql
