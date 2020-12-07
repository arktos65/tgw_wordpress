# frozen_string_literal: true

source 'https://rubygems.org'

gem 'berkshelf'
gem 'chefspec'
gem 'foodcritic'
gem 'public_suffix'
gem 'rake'
gem 'rubocop'
gem 'thor'

group :travis do
  gem 'test-kitchen', '~> 2.7', '>= 2.7.2'
end

group :local do
  gem 'docker-api', '~> 2.0', '>= 2.0.0'
  gem 'kitchen-inspec', '~> 2.2.1'
  gem 'kitchen-vagrant', '~> 1.7', '>= 1.7.0'
end