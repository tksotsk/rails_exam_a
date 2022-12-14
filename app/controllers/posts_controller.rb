class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def edit
  end
  
  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end
  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "ツイートが編集されました" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "ツイートが削除されました" }
      format.json { head :no_content }
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  private
    
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:content)
  end
end
