require "rubygems"
require "bundler"
Bundler.setup(:default, :development)

require 'activemodel-warnings'

require 'test/unit'
require 'active_support/test_case'
require 'mocha'

require 'minitest-instrument'
require 'minitest-instrument-db'

Minitest::Instrument::Db.try_configuration_at(  File.join( File.dirname(__FILE__), 'instrument', 'database.yml' ) , :project => 'activemodel-warnings')
