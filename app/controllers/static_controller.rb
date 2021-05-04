class StaticController < ApplicationController

  def welcome
	@subject = Subject.all
	 @activity = Activity.all.last(3)
  end
  def about
	 @activity = Activity.all.last(3)
  end
  def chat
	 @activity = Activity.all.last(3)
  end
  def achievements
	 @activity = Activity.all.last(3)
  end
  def info
	@activity = Activity.all.last(3)
	@user = User.find(params[:id])
  end
end
