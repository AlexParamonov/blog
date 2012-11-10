# module Extentions
#   module Validation
#     class ModelErrors
#       def initialize(args)
#         @model_name, @messages = args.fetch(:model_name), args.fetch(:messages)
#       end

#       def count
#         messages.count
#       end

#       def any?
#         messages.any?
#       end

#       def messages
#         @messages || []
#       end

#       def model_name
#         @model_name || raise(RuntimeError.new 'model_name not set')
#       end
#     end
#   end
# end
