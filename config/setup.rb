require 'bundler/setup'
require 'yaml'
require 'active_record'

ENVIRONMENT = ENV['ENVIRONMENT'] || 'development'

$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

db_path = File.expand_path('../database.yml', __FILE__)
db_config = YAML::load(File.open(db_path))

ActiveRecord::Base.establish_connection(db_config[ENVIRONMENT])
