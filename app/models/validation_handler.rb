require_relative 'validation_handler/active_model_extractor'

module ValidationHandler
  def self.for(object)
    if object.respond_to?(:errors) && object.errors.is_a?(ActiveModel::Errors)
      active_model(object)
    else
      raise RuntimeError, "Handler for #{object} is missing"
    end
  end

  def self.active_model(object)
    ActiveModelExtractor.new(object)
  end
end
