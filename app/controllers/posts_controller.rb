class PostsController < ApplicationController

	def new
		authenticate()
		@post = Post.new
	end

	def create
		authenticate()
		@post = Post.new(post_parameters)
		if @post.save
			redirect_to '/blog'
		else
			render 'new'
		end
	end

	def index
	end
	
	def list
		authenticate()
		@post = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end
	
	def edit 
		authenticate()
		@post = Post.find(params[:id])
	end
	
	def update
		authenticate()
		@post = Post.find(params[:id])
		 
		if @post.update(post_parameters)
			redirect_to '/blog'
		else
			render 'edit'
		end
	end
	
	def destroy
		authenticate()
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to '/admin'
	end
	
	def admin
		authenticate()
	end
	
	def find
		@title = params[:title]
		@post = Post.find_by title: @title
		respond_to do |format|
			format.js {}
		end
	end
	
	def more
		amount = 3
		@offset = params[:offset].to_i
		dir = params[:direction]
		@len = Post.all.count
		
		
		if dir == "back" && @offset+amount < @len
			@offset += amount
		elsif dir == "forward" && @offset > 0
			@offset -= amount
		end
		respond_to do |format|
			format.js {}
		end
	end
	

private
		def post_parameters
			params.require(:post).permit(:title, :text, :date)
		end

		def authenticate
		  authenticate_or_request_with_http_basic do |user_name, password|
			session[:admin] = (user_name == "Admin" && password == "K1ttensRAwesome")
		  end
		end

end
