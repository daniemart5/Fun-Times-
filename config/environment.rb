require 'bundler'
require 'active_record'

Bundler.require

require_relative '../lib/event'
require_relative '../lib/experience'
require_relative '../lib/location'
require_relative '../lib/user'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
