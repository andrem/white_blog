class Admin::BlogController < ApplicationController
  layout "admin"


  def login
    if request.post?
	  @user = User.find_by_login(params[:login])

	  if @user and @user.password_is? params[:password]
	    session[:uid] = @user.id
	    redirect_to :action => 'index'
	  else
	    @auth_error = 'Wrong username or password'
	  end
	end
  end
 
 
  def logout
    session[:uid] = nil

    redirect_to :action => 'login'
  end

  def index
    check_auth
    @posts =  Post.all
  end


  # posts
  def add_post
	check_auth
	@post = Post.new
  end
 
  def add_post_new
   check_auth
   @post = Post.new(params[:post])

   if @post.save
     redirect_to :action => "index"
   else
     redirect_to :action => "add_post" 
   end
  end

  def edit
	check_auth
	@post = Post.find(params[:id])
  end

  def edit_post
     check_auth
     @post = Post.find(params[:post][:id])

	 if @post.update_attributes(params[:post])
	 	redirect_to :action => "index"
	 else
	 	redirect_to :action => "edit", :id => params[:post][:id]
	end

  end

  def destroy
    check_auth
	if request.get?
	  @posts = Post.find(params[:id])
	  @posts.destroy

	 redirect_to :action => "index" 
    end
  end

  def check_auth
    unless session[:uid]
		redirect_to :action => "login"
	end
  end
	
end
