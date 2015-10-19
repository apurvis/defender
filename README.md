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

# Data Model

## Cases

Has basic information about the case (e.g. its docket number, district, etc.) and manages links between all the participants (attorneys, defendants, witnesses, judges, etc.).

## People

Self explanatory.  Have phone numbers, addresses, etc.

## PeopleCases

The links between people and cases.  This is where information about HOW a `Person` relates to a `Case` is encoded - for instance the fact that John is the `Judge`, or Jane is the `Witness`, or Jim is the `Defendant` all would be encoded at the `PeopleCase` level.  This allows a single person to play multiple roles in different cases.

### PeopleCase Subclasses

The possible ways a person can relate to a case are:

* `Judge`
* `DefenseAttorney`
* `ProsecutingAttorney`
* `Complainant`
* `Defendant`
* `Witness`

## Charges

There is a basic `Charge` class containing the name of the charge (e.g. "Robbery") and its type (e.g. "Misdemeanor").  Charges are attached to `Defendants` within a `Case`.
