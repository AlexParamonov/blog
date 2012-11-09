class PostsController < ApplicationController
  respond_to :html
  before_filter :find_post, only: %w(show)

  def index
    @posts = exhibit(Post.all)
    @posts = presenter_for @posts
  end

  def show; end

  private
  def find_post
    @post = exhibit feed.post(params.fetch :id)
    @post = presenter_for @post
  end
end
