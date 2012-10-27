class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = exhibit(Post.all)
    respond_with(@posts)
  end

  def show
    @post = exhibit(feed.post(params[:id]))
    respond_with(@post)
  end

  private
  def form_exhibit(object)
    exhibit(ValidationExhibit.new(object, self))
  end
end
