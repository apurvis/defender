Defender
================

Basic rails app for public defender case management.

# Installation

This application requires:

- Ruby 2.2.2
- Rails 4.2.3

There is a ```.ruby-version``` file in the root of the project if you are a user of [RVM](https://rvm.io/workflow/projects).

```
git pull
bundle exec rake db:create
bundle exec rake db:migrate

# Optionally you can elect to load some bootstrap sample data into your development environment.

bundle exec data_script/bootstrap_development_data.rb
```

Then launch a rails console and set yourself up a user:
```ruby
user = User.new(:email => 'test_account@test.com', :password => 'b00kies1999')
user.skip_confirmation!
user.role = 'admin'
user.save
```

