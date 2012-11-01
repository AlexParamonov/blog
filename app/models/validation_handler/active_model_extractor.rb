require_relative "extractor"

module ValidationHandler
  class ActiveModelExtractor < Extractor
    def model_name
      object.class.model_name.human
    end

    def messages
      object.errors.full_messages
    end
  end
end
