require_relative "../config/initializers/xpath_rel_patch"
require 'pry'

ENV['RAILS_ENV'] ||= 'test'
require "rspec"

$: << File.expand_path('../lib', File.dirname(__FILE__))
