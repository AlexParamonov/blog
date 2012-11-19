require "extentions"
require "tags/extention"
require "tags/adapters/active_record"
require "validation/extention"
# Extentions.register %w(tags)

Extentions::Tags::Extention.configure do |config|
  config.adapter = Extentions::Tags::Adapter::ActiveRecord
end

Extentions.register Extentions::Tags::Extention
Extentions.register Extentions::Validation::Extention

