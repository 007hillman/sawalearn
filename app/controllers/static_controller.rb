class StaticController < ApplicationController

  def welcome
  	
		@subject = Subject.all
		@activity = active
		render layout: "empty_layout"
  end
  def about
	 @activity = active
  end
  def chat
	 @activity = active
  end
	def admin_dash
		@activity = active
		render layout: "empty_layout" 
	end
  def achievements
	 @activity = active
  end
  def info
	@activity = active
	@user = User.find(params[:id])
  end
	def active
		Activity.all.where(user_id: current_user.id).order( "created_at DESC" ).first(4)
	end
	def landing_page
		@activity = active
		render :layout => "empty_layout"
	end
end
