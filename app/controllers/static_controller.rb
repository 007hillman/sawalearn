class StaticController < ApplicationController

  def welcome
	@subject = Subject.all
	 @activity = active
  end
  def about
	 @activity = active
  end
  def chat
	 @activity = active
  end
  def achievements
	 @activity = active
  end
  def info
	@activity = Activity.active
	@user = User.find(params[:id])
  end
	def active
		Activity.all.order( "created_at DESC" ).first(4)
	end
end
