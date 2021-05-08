class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many :user_lesson_quiz, dependent: :destroy 
end
