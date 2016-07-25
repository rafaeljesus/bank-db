require 'rubygems'
require 'bundler'
require 'codeclimate-test-reporter'

ENV['ENVIRONMENT'] = 'test'

require_relative '../config/setup'
require 'bank_db'

CodeClimate::TestReporter.start

Bundler.require(:default, ENV['ENVIRONMENT'])

RSpec.configure do |config|
  config.order = :random

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end
end
