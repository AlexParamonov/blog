require 'display_case'
require_relative '../models/validation_handler'

# only manual exhibition
class ValidationExhibit < DisplayCase::Exhibit
  def render_errors
    if errors.any?
      # TODO investigate why array is returned
      context.render(partial: 'validation/errors', locals: {errors: errors}).first
    end
  end

  private
  def errors
    @errors ||= ValidationHandler.for(self).errors
  end
end
