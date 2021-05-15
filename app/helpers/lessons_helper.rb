module LessonsHelper

	def lesson_status(les_id)
    item = UserLesson.find_by(lesson_id: les_id)
    if item != nil
      return(item.status)
    else
      return("")
    end
  end

end
