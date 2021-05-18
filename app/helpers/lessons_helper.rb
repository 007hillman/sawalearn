module LessonsHelper

	def lesson_status(les_id)
    item = UserLesson.find_by(lesson_id: les_id)
    if item != nil
      return(item.status)
    else
      return("")
    end
  end

	def lesson_completion_percent(les_id)
    if UserLessonQuiz.where(completed: true).joins(:lesson).where("lessons.id =?",les_id).empty?
      return(0)
    else
      return (UserLessonQuiz.where(completed: true).joins(:lesson).where("lessons.id =?",les_id).count.to_f/Lesson.find(les_id).quizzes.count.to_f)*100
    end
  end

  def lesson_status_colour(les_id)
    if lesson_completion_percent(les_id) < 50
      return("red-400")
    elsif lesson_completion_percent(les_id) >= 50 && lesson_completion_percent(les_id) < 100
      return("yellow-300")
    else
      return("green-500")
    end
  end

 
end
