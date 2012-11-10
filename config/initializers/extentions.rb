require "extentions"
require "tags/extention"
require "validation/extention"
# Extentions.register %w(tags)
Extentions.register Extentions::Tags::Extention
Extentions.register Extentions::Validation::Extention
