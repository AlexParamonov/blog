require_relative "../spec_helper_lite"
require_relative "../../app/exhibits/tags_exhibit"

describe TagsExhibit do
  describe "#render_tags" do
    it "should render nothing if got unknown context action" do
      template = stub.as_null_object
      context = stub(:context, action_name: :unknown)
      exhibit = TagsExhibit.new(stub, context)
      presenter = mock(:presenter)
      presenter.should_receive(:render_nothing)
      exhibit.stub(:presenter).and_return(presenter)

      exhibit.render_tags(template)
    end
  end
end

