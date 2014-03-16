$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'omniauth-connexio'

require 'rubygems'
require 'bundler'
Bundler.setup :default, :test

require 'coveralls'
Coveralls.wear!

require 'rspec'
