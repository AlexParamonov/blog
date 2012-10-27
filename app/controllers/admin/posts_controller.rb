module Admin
  class PostsController < ApplicationController
    respond_to :html

    def index
      @posts = exhibit(Post.all)
    end

    def show
      @post = exhibit(feed.post(params[:id]))
    end

    def new
      @post = form_exhibit(feed.new_post)
    end

    def edit
      @post = form_exhibit(feed.post(params[:id]))
    end

    def create
      @post = form_exhibit(feed.new_post(params[:post]))

      # TODO remove if-else, use callbacks
      if @post.publish
        redirect_to admin_posts_path, notice: t("post.message.published")
      else
        render 'new'
      end
    end

    def update
      @post = form_exhibit(feed.post(params[:id]))

      if @post.update_attributes(params[:post])
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render action: "edit"
      end
    end

    def destroy
      @post = feed.post(params[:id])
      @post.destroy

      respond_with(@post)
    end

    private
    def form_exhibit(object)
      exhibit(ValidationExhibit.new(object, self))
    end
  end
end
