ENV['RAILS_ENV'] ||= 'test'
require 'pry' if 'test' == ENV['RAILS_ENV']
require "rspec"

$: << File.expand_path('../lib', File.dirname(__FILE__))
