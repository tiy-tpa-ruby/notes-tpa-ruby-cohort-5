# Gavin's testing presentation

- See PDF in this folder

# Adding rspec + guard to a ruby app

## Create a `Gemfile`
```
source 'https://rubygems.org'

group :development do
  # Testing gem
  gem 'rspec'

  # guard to auto-run our tests continuously
  gem 'guard-rspec', require: false

  # Get notifications on OS X
  gem 'terminal-notifier-guard'
end
```

## Initialize `rspec`
`rspec --init`

## Initialize guard
`bundle exec guard init rspec`

## Run guard
`bundle exec guard`

## Create a spec in `spec/fizzbuzz_spec.rb`
```
require_relative "spec_helper"

describe FizzBuzz do
  it "...." do
    # code here
  end
end
```
