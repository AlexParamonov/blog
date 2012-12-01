require "ostruct"
require_relative 'action_framework'
require_relative 'test_user'

# TODO load only if Rails are used
class PostBackground
  include Rails.application.routes.url_helpers
  include ActionFramework

  def publish_post(factory, *options)
    FactoryGirl.build(factory).tap {|post| post.publish!(*options)}

    # admin.visit_new_post_page

    # post = OpenStruct.new FactoryGirl.attributes_for(factory)
    # admin.fill_in post.title   => 'post_title',
    #               post.summary => 'post_summary',
    #               post.content => 'post_content'

    # admin.iclick "post.buttons.publish"

    # post
  end

  private
  def admin
    @admin ||=
      TestUser.new.tap do |user|
        user.action_framework = action_framework
      end.extend TestUser::PostAdmin
  end
end
