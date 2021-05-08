class AnalysisController < ApplicationController

	def failed
		quiz = UserLessonQuiz.where(quiz_id: next_quiz ).first
		quiz.completed = true
		quiz.verdict = "failed"
		quiz.save
	end

	def passed
		quiz = UserLessonQuiz.where(quiz_id: next_quiz ).first
        quiz.completed = true
        quiz.verdict = "passed"
        quiz.save
	end
end
