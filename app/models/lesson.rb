class Lesson < ApplicationRecord
  belongs_to :subject
	has_many :quizzes, dependent: :delete_all
	has_one_attached :lesson_video, dependent: :destroy
	has_many_attached :lesson_pictures, dependent: :destroy

#validations
	
end
