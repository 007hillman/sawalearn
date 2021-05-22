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
		@user = nil
		if params[:id]
			if params[:admin_dash]
				user = User.find(params[:id])
				user.role = Role.find(params[:admin_dash][:role_id])
				user.save
			end
				@user = User.find(params[:id])
		end
		respond_to do |format|
			format.html { render layout: "empty_layout" }
		end	
	end
  def achievements
	 @activity = active
  end
  def usermore
		@activity = active
  end
	def active
		Activity.all.where(user_id: current_user.id).order( "created_at DESC" ).first(4)
	end
	def landing_page
		@activity = active
		render :layout => "empty_layout"
	end

end
