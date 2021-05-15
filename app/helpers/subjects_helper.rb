module SubjectsHelper

	def subject_status(sub_id)
		item = UserSubject.find_by(subject_id: sub_id)
		if item != nil
			puts "found one of them .................................................."
			return(item.status)
		else
			return("")
		end
	end

end
