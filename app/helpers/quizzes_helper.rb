module QuizzesHelper
  def finished_quizzes?(les_id)
    UserLessonQuiz.where(lesson_id: les_id, completed: true).count == Lesson.find(les_id).quizzes.count
  end
	def quiz_number(les_id)
		finished_quizzes(les_id) + 1
	end
end
