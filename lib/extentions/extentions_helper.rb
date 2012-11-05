module Extentions
  module ExtentionsHelper
    def extentions(model, context=self)
      Extentions.extentions_for(model, context)
    end
  end
end

