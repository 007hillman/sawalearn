class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :update_allowed_parameters, if: :devise_controller?

@@subject = nil

	def current_subject
		if params[:sub_id]
			session[:sub_id_s] = params[:sub_id]
		end
		Subject.find(session[:sub_id_s])
	end
	def current_lesson
        if params[:less_id]
            session[:less_id_s] = params[:less_id]
        end
        Lesson.find(session[:less_id_s])
    end
	
	def next_quiz
		current_index = Quiz.where(lesson_id: current_lesson.id)[UserLessonQuiz.where(lesson_id: current_lesson.id, completed: true , user_id: current_user.id).count]
		if current_index != nil
		session[:quiz_index] = current_index.id
		return current_index.id
		else 
		return 0
		end
	end
	
	def check_quiz
		Quiz.where(lesson_id: current_lesson.id)
	end

	def check_for_restart
		UserLessonQuiz.where(lesson_id: current_lesson.id).first
	end
	def get_verdict (q_id)
		UserLessonQuiz.where(quiz_id: q_id, user_id: current_user.id, lesson_id: current_lesson.id)[0].verdict
	end

helper_method :current_subject, :current_lesson, :next_quiz, :check_for_restart, :check_quiz, :get_verdict
	protected 
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password,:password_confirmation,:gender, :region, :school, :date_of_birth)}
    devise_parameter_sanitizer.permit(:account_update) { |u|    
    			u.permit(:name, :surname, :email, :password,:password_confirmation,:gender, :region, :school, :date_of_birth)}
  end
end
