class ApplicationController < ActionController::Base
  include DisplayCase::ExhibitsHelper
  protect_from_forgery
  helper_method :feed

  def feed
    @feed ||= exhibit(THE_FEED)
  end

  def module_name
    parts = self.class.name.split("::")
    parts.size > 1 ? parts.first : nil
  end
end
