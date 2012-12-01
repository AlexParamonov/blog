require_relative "../../../spec_helper"
require_relative "../../../support/test_user"
require_relative "../../../support/post_background"

describe "Validation extention" do
  include I18nSupport
  include SpecHelpers
  include Rails.application.routes.url_helpers

  let(:user) { TestUser.new self }
  let(:background) { PostBackground.new self}

  let(:alex) { user.act_as 'Post::Admin' }

  before(:each) do
    alex.visit_new_page
  end

  it "should render errors if save failed" do
      post = OpenStruct.new(
        title:    '',
        summary:  'Post summary',
        content:  'Post content'
      )
      fill_in post.title   => 'post_title',
              post.summary => 'post_summary',
              post.content => 'post_content'

      iclick "post.button.publish"
      within '#model-error' do
        see "error"
      end
  end
end
