Defender
================

Basic rails app for public defender case management.

# Installation

```
git pull
bundle exec rake db:create
bundle exec rake db:migrate
# Optionally you can elect to load some bootstrap sample data into your development environment.
bundle exec data_script/bootstrap_development_data.rb
```

Then launch a rails console and set yourself up a user:
```ruby
user = User.new(:email => 'test_account@test.com', :password => 'b00kies')
user.skip_confirmation!
user.role = 'admin'
user.save
```