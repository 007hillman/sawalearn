class StaticController < ApplicationController

  def welcome
	@subject = Subject.all
	 @activity = Activity.all
  end
  def about
	 @activity = Activity.all
  end
  def chat
	 @activity = Activity.all
  end
  def achievements
	 @activity = Activity.all
  end
end
