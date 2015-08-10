class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  skip_before_filter  :verify_authenticity_token
  protect_from_forgery except: :create

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
    puts params.keys

    if params['from']
      @user = User.find_by(phone_number: twilio_post_params['from'])

      if @user
        @post = @user.posts.new(post: twilio_post_params['body'])

        if @post.save
          account_sid = ENV['twilio_account_sid']
          auth_token  = ENV['twilio_auth_token']

          @client = Twilio::REST::Client.new account_sid, auth_token
          @message = @client.account.messages.create({:to => current_user.phone_number,
                                   :from => "+19177465165",
                                   :body => "Thank you! We've added your post to the database."})
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

  # skip_before_filter :verify_authenticity_token, only: :create_from_twilio
  # protect_from_forgery except: :create_from_twilio
  # def create_from_twilio
  # end

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
      params.permit(:body, :from)
    end
end
