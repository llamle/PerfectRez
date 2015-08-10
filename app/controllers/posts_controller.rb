class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token
  protect_from_forgery with: :null_session

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if params['from']
      account_sid = ENV['twilio_account_sid']
      auth_token  = ENV['twilio_auth_token']

      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.account.messages.list.each do |message|
        if current_user.phone_number == twilio_post_params['from']
          @post = Post.new(post: twilio_post_params['body'])

          if @post.save
            @message = @client.account.messages.create({:to => current_user.phone_number,
                                     :from => "+19177465165",
                                     :body => "Thank you! We've added your post to the database."})
          end
        end
      end

      head :ok, content_type: "text/html"
    else
      @post = Post.new(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to :back, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :post)
    end

    def twilio_post_params
      params.permit(:body, :from, :post)
    end
end
