require "display_case"
# require "extentions"

module DisplayCase
  class EnumerableExhibit < Exhibit
    def exhibit(model)
      exhibited = super
      Extentions.extentions_for(exhibited, context).build_presenter
    end
  end
end

