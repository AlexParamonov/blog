class PostsController < ApplicationController
  respond_to :html, :json

  # GET /posts
  # GET /posts.json
  def index
    @posts = exhibit(Post.all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = exhibit(feed.post(params[:id]))
    respond_with(@post)
  end

  def new
    @post = form_exhibit(feed.new_post)
  end

  def edit
    @post = form_exhibit(feed.post(params[:id]))
    respond_with(@post)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = form_exhibit(feed.new_post(params[:post]))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = form_exhibit(feed.post(params[:id]))

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
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
