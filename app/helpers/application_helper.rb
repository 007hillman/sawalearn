module ApplicationHelper
	def user_stat(domain)
		if domain.to_s == "total"
			return User.all.count
		elsif domain.to_s == "adminpercentage"
			percent = (User.joins(:role).where(role_id: 1).count.to_f/User.all.count.to_f)*100
		elsif domain.to_s == "userspercentage"
			percent = (User.joins(:role).where(role_id: 2).count.to_f/User.all.count.to_f)*100
		elsif domain.to_s == "student_number"
			User.joins(:role).where(role_id: 2).count
		elsif domain.to_s == "lecturer_number"
			User.joins(:role).where(role_id: 1).count
		end
	end
	def lesson_stat(domain)
    if domain.to_s == "total"
      return Lesson.all.count
    end
  end
	def subject_stat(domain)
    if domain.to_s == "total"
      return Subject.all.count
    end
  end
	def quiz_stat(domain)
    if domain.to_s == "total"
      return Quiz.all.count
    end
  end

end
