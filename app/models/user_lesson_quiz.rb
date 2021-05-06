class UserLessonQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :quiz

	def self.check_presence(q_id)
		UserLessonQuiz.where(quiz_id: q_id)
	end
	def self.purge(l_id)
		records = UserLessonQuiz.where(lesson_id: l_id)
		records.each do |rec|
			rec.destroy
		end
	end
end
