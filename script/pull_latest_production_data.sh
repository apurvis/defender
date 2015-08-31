pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

bundle install
bundle exec rake db:drop
heroku pg:pull DATABASE_URL defender_development --app d-fender
bundle exec rails server

#Start psql interactive local session
#/usr/local/bin/psql -d controlled_sub_data_development
