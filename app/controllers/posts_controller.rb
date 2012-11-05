class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = exhibit(Post.all)
    @posts = extentions(@posts).build_presenter
    respond_with(@posts)
  end

  def show
    @post = exhibit(feed.post(params[:id]))
    @post = extentions(@post).build_presenter
    respond_with(@post)
  end
end
