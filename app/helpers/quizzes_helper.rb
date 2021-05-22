module QuizzesHelper
  def finished_quizzes?(les_id)
    UserLessonQuiz.where(lesson_id: les_id, completed: true, user_id: current_user.id).count == Lesson.find(les_id).quizzes.count
  end
	def quiz_number(les_id)
		UserLessonQuiz.where(lesson_id: current_lesson.id, completed: true , user_id: current_user.id).count + 1
	end
	def get_failed
		UserLessonQuiz.where(user_id: current_user.id,lesson_id: current_lesson.id, verdict: "failed").count
	end
	def get_passed
		UserLessonQuiz.where(user_id: current_user.id, lesson_id: current_lesson.id, verdict: "passed").count
	end

	def get_percentage
		(get_passed.to_f/Lesson.find(current_lesson.id).quizzes.count.to_f)*100
	end
	def get_decision
		if get_percentage < 60
			return "Not completed"
		else
			return "Completed"
		end
	end
end
