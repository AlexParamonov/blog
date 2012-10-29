class ApplicationController < ActionController::Base
  include DisplayCase::ExhibitsHelper
  protect_from_forgery

  def feed
    @feed ||= exhibit(THE_FEED)
  end
end
