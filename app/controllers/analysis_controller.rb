class AnalysisController < ApplicationController

	def failed
		quiz = UserLessonQuiz.where(quiz_id: next_quiz ).first
		if quiz == nil

		else
		quiz.completed = true
		quiz.save
		end
	end

	def passed
		quiz = UserLessonQuiz.where(quiz_id: next_quiz ).first
        quiz.completed = true
        quiz.save
	end
end
