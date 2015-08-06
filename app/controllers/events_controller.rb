class EventsController < ApplicationController

	def new
		authenticate()
		@event = Event.new
	end

	def create
		authenticate()
		@event = Event.new(event_parameters)
		if @event.save
			redirect_to '/events'
		else
			render 'new'
		end
	end

	def index
		@event = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end
	
	def list
		@event = Event.all
	end
	
	def edit 
		authenticate()
		@event = Event.find(params[:id])
	end
	
	def update
		authenticate()
		@event = Event.find(params[:id])
		 
		if @event.update(event_parameters)
			redirect_to '/events'
		else
			render 'edit'
		end
	end
	
	def destroy
		authenticate()
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to '/admin'
	end

	def find
		@title = params[:title]
		@event = Event.find_by title: @title
		respond_to do |format|
			format.js {}
		end
	end

private
		def event_parameters
			params.require(:event).permit(:title, :text, :date, :time, :venue)
		end

		def authenticate
		  authenticate_or_request_with_http_basic do |user_name, password|
			session[:admin] = (user_name == "Admin" && password == "K1ttensRAwesome")
		  end
		end

end
