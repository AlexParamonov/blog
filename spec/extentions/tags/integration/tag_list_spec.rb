require_relative "../../../spec_helper_lite"
require_relative "../../../../app/extentions/tags/models/tag_list"
require_relative "../../../../app/extentions/tags/models/tag"

describe Extentions::Tags::Model::TagList do
  let(:extention)  { Extentions::Tags }
  let(:list) { extention::Model::TagList }
  let(:tag) { extention::Model::Tag }

  let(:tag_list) { list.new tags }
  let(:tags) { string_tags.map { |tag_name| tag.new name: tag_name } }
  let(:string_tags) { [] }

  describe "integrate with Tag objects" do
    describe "duplications" do
      let(:string_tags) { %w(ruby raIls fOO ruby) }

      it "eliminates duplicates and lowercase tags" do
        tag_list.to_a.should eq %w(ruby rails foo)
      end
    end

    describe "ordering" do
      let(:string_tags) { %w(ruby rails foo ruby) }

      it "sort tag object" do
        tag_list.sort.each { |tag_object| tag_object.should be_a tag }
      end
    end
  end
end
