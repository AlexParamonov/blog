require 'extentions/extentions_helper.rb'

class ApplicationController < ActionController::Base
  include DisplayCase::ExhibitsHelper
  include Extentions::ExtentionsHelper

  protect_from_forgery
  helper_method :feed

  def feed
    @feed ||= exhibit(THE_FEED)
  end
end
