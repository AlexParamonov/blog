require 'display_case'
require_relative '../models/validation_handler'

# only manual exhibition
class ValidationExhibit < DisplayCase::Exhibit
  def render_errors(template)
    if errors.any?
      template.render('validation/errors', errors: errors).html_safe
    end
  end

  private
  def errors
    @errors ||= ValidationHandler.for(self).errors
  end
end
