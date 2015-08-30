Defender
================

Basic rails app for public defender case management.

# Installation

```
git pull
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec script/populate_initial_data.rb
```

Then launch a rails console and set yourself up a user:
```ruby
user = User.new(:email => 'test_account@test.com', :password => 'b00kies')
user.skip_confirmation!
user.role = 'admin'
user.save
```