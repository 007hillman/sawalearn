class StaticController < ApplicationController
  def welcome
	@subject = Subject.all
  end
  def about
  end
end
