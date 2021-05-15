class Lesson < ApplicationRecord
  belongs_to :subject
	has_many :quizzes, dependent: :delete_all
	has_one_attached :lesson_video, dependent: :destroy
	has_many_attached :lesson_pictures, dependent: :destroy
	has_many :user_lesson_quizzes, dependent: :destroy
	has_many :user_lessons, dependent: :destroy
	has_rich_text :lesson_notes
#validations


	scope :unquizzed, -> { where( :quizzes_count => 0) }	
end
