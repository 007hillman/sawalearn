module QuizzesHelper
  def finished_quizzes?(les_id)
    UserLessonQuiz.where(lesson_id: les_id, completed: true, user_id: current_user.id).count == Lesson.find(les_id).quizzes.count
  end
	def quiz_number(les_id)
		UserLessonQuiz.where(lesson_id: current_lesson.id, completed: true , user_id: current_user.id).count + 1
	end
end
