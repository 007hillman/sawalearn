class UserLessonQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :quiz

	def self.check_presence(q_id)
		UserLessonQuiz.where(quiz_id: q_id)
	end
	def self.purge(l_id)
		records = UserLessonQuiz.where(lesson_id: l_id).delete_all
	end

	scope :failed, ->(u_id, l_id){where("user_id: ?, lesson_id: ?,verdict: ?", u_id, l_id, "failed")}
	scope :passed, ->(u_id, l_id){where("user_id: ?, lessson_id: ?,verdict: ?", u_id, l_id, "passed")}
end
