require 'rubygems'
require 'bundler'
require 'codeclimate-test-reporter'
require 'active_record'
# require 'factory_girl'

ENV['ENVIRONMENT'] = 'test'

require_relative '../config/setup'
require 'bank_db'

CodeClimate::TestReporter.start

Bundler.require(:default, ENV['ENVIRONMENT'])

ActiveRecord::Migration.maintain_test_schema!

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.order = :random
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.before(:suite) do
    DatabaseCleaner.start
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end

  config.expect_with(:rspec) do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with(:rspec) do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end
end
