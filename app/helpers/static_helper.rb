module StaticHelper

	def quizzed_lessons(sub_id)
		number = 0
		lessons = Lesson.where(subject_id: sub_id)
		lessons.each do |lesson|
			if !lesson.quizzes.empty?
				number+=1
			end
		end
		return (number)
	end
	def subject_completion_percent(sub_id)
		if UserLesson.where(status: "completed").joins(:lesson).where("lessons.subject_id =?",sub_id).empty?
			return(0)
		else
			return (UserLesson.where(status: "completed").joins(:lesson).where("lessons.subject_id =?",sub_id).count.to_f/quizzed_lessons(sub_id).to_f)*100
		end
	end
	
	def status_colour(sub_id)
		if subject_completion_percent(sub_id) < 50
			return("red-400")
		elsif subject_completion_percent(sub_id) >= 50 && subject_completion_percent(sub_id) < 100
			return("yellow-300")
		else
			return("green-500")
		end
	end
 	def lesson_count(sub_id)
		Lesson.where(subject_id: sub_id).count
	end
end
