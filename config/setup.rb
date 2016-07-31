require 'bundler/setup'
require 'yaml'
require 'active_record'

ENVIRONMENT = ENV['ENVIRONMENT'] || 'development'

$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

db_config = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(db_config[ENVIRONMENT])
