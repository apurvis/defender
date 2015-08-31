bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails r data_script/bootstrap_development_data.rb
